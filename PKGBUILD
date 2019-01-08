pkgbase=python-assimulo
pkgname=('python-assimulo' 'python2-assimulo')
pkgver=3.0
pkgrel=1
pkgdesc="A package for solving ordinary differential equations and differential algebraic equations"
url="http://www.jmodelica.org/assimulo"
arch=('i686' 'x86_64')
license=('LGPL')
makedepends=('python-setuptools' 'python2-setuptools' 'cython' 'cython2' 'gcc-fortran' 'sundials' 'lapack' 'subversion')
# PyPI archive is missing .pyf files
# source=("https://pypi.io/packages/source/A/Assimulo/Assimulo-${pkgver}.tar.gz")
source=("svn+https://svn.jmodelica.org/assimulo/tags/Assimulo-${pkgver}" sundials4.patch)
md5sums=('SKIP' SKIP )

prepare() {
  cd "${srcdir}"/Assimulo-$pkgver

  # try to build with sundials 4.0
  patch -p0 -i "${srcdir}"/sundials4.patch
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
