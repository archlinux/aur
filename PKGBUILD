pkgname=python-assimulo
pkgver=3.2
pkgrel=1
pkgdesc="A package for solving ordinary differential equations and differential algebraic equations"
url="http://www.jmodelica.org/assimulo"
arch=('i686' 'x86_64')
license=('LGPL')
makedepends=('python-setuptools' 'cython' 'gcc-fortran')
depends=('python-scipy' 'python-matplotlib' 'lapack' 'sundials')
source=("https://github.com/modelon-community/Assimulo/archive/Assimulo-${pkgver}.tar.gz" sundials5.patch)
sha256sums=('SKIP' 'SKIP')

prepare() {
  cd "${srcdir}"/Assimulo-Assimulo-$pkgver

  # try to build with sundials 5.0
  patch -p0 -i "${srcdir}"/sundials5.patch

  # use shared lib
  sed -i "s|BLASname_t+'.a'|BLASname_t+'.so'|g" setup.py
}

build() {
  cd "${srcdir}"/Assimulo-Assimulo-$pkgver
}

package() {
  cd "${srcdir}"/Assimulo-Assimulo-$pkgver
  python setup.py install --root=${pkgdir} --optimize=1 --extra-fortran-link-flags="-shared" --sundials-home=/usr --blas-home=/usr/lib --lapack-home=/usr
}

