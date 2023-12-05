# Maintainer: Dan Johansen <strit@strits.dk>

## Build order:
## libdesq -> desq-session -> desq-shell

_pkgname=Session
pkgname=desq-session
pkgver=0.0.8
pkgrel=1
pkgdesc="Session Manager for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ"
license=('GPL3')
depends=('qt5-base' 'libdesq' 'dfl-utils' 'dfl-xdg' 'dfl-applications' 'dfl-login1')
makedepends=('meson' 'ninja')
source=("https://gitlab.com/DesQ/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('f9681db5d92bfac8cde442f9506a22b1')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
