# Maintainer: Dan Johansen <strit@strits.dk>

## Build order:
## libdesq -> libdesqui -> desq-session -> desq-shell

pkgname=libdesqui
pkgver=0.0.8
pkgrel=1
pkgdesc="DesQ UI Library. This library contains all the common UI widget which are to be used across the DesQ Project."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/${pkgname}"
license=('GPL3')
depends=('qt5-base' 'libdesq' 'dfl-layouts')
makedepends=('meson' 'ninja')
source=("https://gitlab.com/DesQ/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
md5sums=('ef1db757d90c03a6e5afc904dfaec21a')

build() {
  cd "${pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
