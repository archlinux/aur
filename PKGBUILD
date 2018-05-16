pkgbase=python-assimulo
pkgname=('python-assimulo' 'python2-assimulo')
pkgver=2.9
pkgrel=4
pkgdesc="A package for solving ordinary differential equations and differential algebraic equations"
url="http://www.jmodelica.org/assimulo"
arch=('i686' 'x86_64')
license=('LGPL')
makedepends=('python-setuptools' 'python2-setuptools' 'cython' 'cython2' 'gcc-fortran' 'sundials' 'lapack')
source=("https://pypi.python.org/packages/4c/c0/19a54949817204313efff9f83f1e4a247edebed0a1cc5a317a95d3f374ae/Assimulo-2.9.zip" r831.patch r833.patch r836.patch r837.patch r838.patch r839.patch r840.patch r841.patch r845.patch)
md5sums=('3f28fd98011d2ec7a01703a1ef1dff45' SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP)

prepare() {
  cd "${srcdir}"/Assimulo-$pkgver
  patch -p0 -i "${srcdir}"/r831.patch
  patch -p0 -i "${srcdir}"/r833.patch
  patch -p0 -i "${srcdir}"/r836.patch
  patch -p0 -i "${srcdir}"/r837.patch
  patch -p0 -i "${srcdir}"/r838.patch
  patch -p0 -i "${srcdir}"/r839.patch
  patch -p0 -i "${srcdir}"/r840.patch
  patch -p0 -i "${srcdir}"/r841.patch
  patch -p0 -i "${srcdir}"/r845.patch
}

build() {
  cp -r "${srcdir}"/Assimulo-$pkgver "${srcdir}"/Assimulo-$pkgver-py2
}

package_python-assimulo() {
  depends=('python-scipy' 'python-matplotlib' 'lapack' 'sundials')

  cd "${srcdir}/Assimulo-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1 --extra-fortran-link-flags="-shared" --sundials-home=/usr
}

package_python2-assimulo() {
  depends=('python2-numpy' 'python2-matplotlib' 'lapack' 'sundials')

  cd "${srcdir}/Assimulo-$pkgver-py2"
  python2 setup.py install --root=${pkgdir} --optimize=1 --extra-fortran-link-flags="-shared" --sundials-home=/usr
}
