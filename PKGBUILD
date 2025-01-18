# Maintainer: Dan Johansen <strit@strits.dk>

## Build order:
## libdesq -> libdesqui -> desq-session -> desq-shell

pkgname=libdesqui
pkgver=0.0.8
pkgrel=2
pkgdesc="DesQ UI Library. This library contains all the common UI widget which are to be used across the DesQ Project."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/${pkgname}"
license=('GPL-3.0-or-later')
depends=(
        'qt5-base'
        'libdesq'
        'dfl-layouts'
)
makedepends=(
            'meson'
            'ninja'
)
source=("https://gitlab.com/DesQ/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('21c67850cd0c88f2c15c7602144281199f07faf325ab0c01b6145a40fcf81300')

build() {
  cd "${pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
