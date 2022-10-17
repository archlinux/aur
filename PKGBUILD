# Maintainer: Dan Johansen <strit@manjaro.org>

## Build order:
## libdesq -> libdesqui -> desq-session -> desq-shell -> desq-theme

_pkgname=Theme
pkgname=desq-theme
pkgver=0.0.7.1
pkgrel=1
pkgdesc="DesQ Themes"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/${_pkgname}"
license=('GPL3')
depends=('qt5-base' 'libdesqui' 'dfl-settings' 'dfl-applications' 'dfl-utils' 'dfl-xdg')
makedepends=('meson' 'ninja')
source=("https://gitlab.com/DesQ/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('d84e32dd63196d9fb921364c3e5a6548')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
