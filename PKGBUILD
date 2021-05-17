# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=libqofono-git
pkgver=0.103.r0.g047b667
pkgrel=1
arch=('x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
pkgdesc="A library for accessing the ofono daemon, and a declarative plugin for it."
url="https://git.sailfishos.org/mer-core/libqofono"
license=('LGPLv2.1')
depends=('qt5-declarative' 'qt5-xmlpatterns')
makedepends=('qt5-tools')
conflicts=('libqofono' 'qofono')
provides=('libqofono' 'qofono')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  mkdir -p "${pkgname%-git}"/build
}

build() {
  cd "${pkgname%-git}"/build
  qmake ../libqofono.pro
  make
}

package() {
  cd "${pkgname%-git}"/build
  INSTALL_ROOT="${pkgdir}" make install
}