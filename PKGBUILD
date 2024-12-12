pkgname=python-assimulo
pkgver=3.6.0
pkgrel=1
pkgdesc="A package for solving ordinary differential equations and differential algebraic equations"
url="http://www.jmodelica.org/assimulo"
arch=('x86_64')
license=('LGPL')
makedepends=('python-setuptools' 'cython' 'gcc-fortran')
depends=('python-scipy' 'python-matplotlib' 'lapack' 'sundials')
source=("https://github.com/modelon-community/Assimulo/archive/Assimulo-${pkgver}.tar.gz")
sha256sums=('d1fc9fa1bb2921290de014dcda1fa04cdb85c1be613df225e75bbb5ed4e06ae4')


prepare() {
  cd "${srcdir}"/Assimulo-Assimulo-$pkgver
  # use shared lib
  sed -i "s|BLASname_t+'.a'|BLASname_t+'.so'|g" setup.py
}

build() {
  cd "${srcdir}"/Assimulo-Assimulo-$pkgver
}

package() {
  cd "${srcdir}"/Assimulo-Assimulo-$pkgver
  python setup.py install --root=${pkgdir} --optimize=1 --extra-fortran-link-flags="-shared" --sundials-home=/usr --blas-home=/usr/lib --lapack-home=/usr --extra-c-flags="-DNPY_NO_DEPRECATED_API=NPY_1_7_API_VERSION"
}

