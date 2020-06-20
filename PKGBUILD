# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=edytornc-git
_pkgname=edytornc
pkgver=r188.aed5f68
pkgrel=1
pkgdesc="Text editor for CNC programmers"
arch=('x86_64')
url='https://github.com/u-235/edytornc'
license=('LGPL3')
provides=('edytornc')
depends=('hicolor-icon-theme'
         'qt5-serialport')
makedepends=('git')
source=("edytornc::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_pkgname}"
  qmake PREFIX="/usr"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make INSTALL_ROOT="${pkgdir}" install
}