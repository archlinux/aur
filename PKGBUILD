
pkgname=python2-george
pkgver=0.2.0
pkgrel=1
pkgdesc="Fast Gaussian Processes for regression"
url="http://dan.iel.fm/george"
arch=(any)
license=('MIT')
depends=('python2-scipy')
makedepends=('hodlr')
source=("https://github.com/dfm/george/archive/v${pkgver}.tar.gz")
md5sums=('SKIP')

build() {
  cd "${srcdir}/george-$pkgver"
  sed -i '62i"/usr/include",' setup.py
  sed -i "s|assemble_Matrix(diag, tol_, 's', seed)|assemble_Matrix(diag, tol_, 's')|g" include/solver.h
  python2 setup.py build
} 

package() {
  cd "${srcdir}/george-$pkgver"
  python2 setup.py install --root="${pkgdir}"
}

