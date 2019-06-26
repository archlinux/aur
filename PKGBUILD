# Maintainer: Luis Sarmiento < lgsarmientop-ala-unal.edu.co >

pkgname=mfile
_pkgname=libmfile
_user=jmayer
pkgver=r57.a18a066
pkgrel=1
pkgdesc="System independent reading and writing of n-dimensional spectra"
url="https://gitlab.ikp.uni-koeln.de/${_user}/${_pkgname}"
arch=('x86_64')
license=('BSD')
makedepends=('git')
depends=('glibc')
options=('!emptydirs')

source=(${_pkgname}::git+https://gitlab.ikp.uni-koeln.de/${_user}/${_pkgname}.git)
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}
  rm -rf build
  mkdir build
  cd build
  cmake ${srcdir}/${_pkgname}
  make
  make test ARGS="-V"
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install

  install -Dm644 ${srcdir}/${_pkgname}/license.md "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
