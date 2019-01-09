# Maintainer: x2b <psaoj.10.Toranaga-San@spamgourmet.com>

pkgname=trlib-git
_pkgname=trlib
pkgdesc="Trust Region Subproblem Solver Library "
arch=('x86_64' 'i686')
url="https://github.com/felixlen/trlib"
license=('MIT')
depends=('lapack' 'openblas')
makedepends=('git')
provides=('trlib')
#conflicts=('trlib')
options=()
source=(git+https://github.com/felixlen/trlib.git)
md5sums=('SKIP')

pkgver=r163.02921d1
pkgrel=1

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  mkdir -p build

  cd build

  cmake .. -DCMAKE_INSTALL_PREFIX:PATH=/usr
}

build() {
  cd "${srcdir}/${_pkgname}"
  cd build

  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"

  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"

  cd build

  make DESTDIR="${pkgdir}" install
}
