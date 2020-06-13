# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=digital-rain-git
_pkgname=digital-rain
pkgver=r8.d3963c4
pkgrel=1
pkgdesc="Recreate the Digital Rain effect from the matrix in a standard terminal"
arch=('x86_64')
url='https://github.com/DavidWKnight/Digital-Rain'
license=('GPL3')
provides=('digital-rain')
depends=('ncurses')
makedepends=('ncurses')
source=("${_pkgname}::git+${url}")
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
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 Digital_Rain.out "${pkgdir}/usr/bin/${_pkgname}"
}