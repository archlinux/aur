# Maintainer: Dan Johansen <strit@manjaro.org>

## Build order:
## libdesq -> desq-session -> desq-shell

_pkgname=Session
pkgname=desq-session
pkgver=0.0.7.1
pkgrel=1
pkgdesc="Session Manager for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ"
license=('GPL3')
depends=('qt5-base' 'libdesq' 'dfl-utils' 'dfl-xdg' 'dfl-applications' 'dfl-login1')
makedepends=('meson' 'ninja')
source=("https://gitlab.com/DesQ/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('f8673d7f636658626a86a81cd9011035')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
