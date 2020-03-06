# Maintainer: Valerii Huz <ghotrix _AT_ gmail _DOT_ com>
pkgname=openblas-cblas-git
_pkgname=OpenBLAS
pkgver=1
pkgrel=1
pkgdesc="An optimized BLAS library based on GotoBLAS2 1.13 BSD "
arch=('any')
url="http://www.openblas.net/"
license=('BSD')
depends=('gcc-libs')
makedepends=('perl' 'gcc-fortran' 'git')
provides=('blas=3.5.0' 'openblas' 'cblas')
conflicts=('blas' 'openblas' 'cblas')
options=(!makeflags !emptydirs)
source=($_pkgname::git+https://github.com/xianyi/OpenBLAS.git)
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"

  make PREFIX="$pkgdir/usr" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
