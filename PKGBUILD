pkgbase=python-pyfmi
pkgname=('python-pyfmi' 'python2-pyfmi')
_majorminor=2.4
pkgver=${_majorminor}.0
pkgrel=1
pkgdesc="A package for working with dynamic models compliant with the FMI standard."
url="http://www.pyfmi.org"
arch=('i686' 'x86_64')
license=('LGPL')
makedepends=('python-setuptools' 'python2-setuptools' 'fmilib' 'cython' 'cython2' 'python-assimulo' 'python2-assimulo' 'python-lxml' 'python2-lxml')
source=("https://pypi.python.org/packages/cc/e5/cf5ecd0a6dcf1b1fff89e7a14de6b3d7888a35b8a2e4db22ddb3a9f9b081/PyFMI-${pkgver}.zip")
sha1sums=('3d8cd9389485f8680f22353e1066d2e8753facfd')

build() {
  cp -r "${srcdir}"/PyFMI-$_majorminor "${srcdir}"/PyFMI-$_majorminor-py2

  cd "${srcdir}"/PyFMI-$_majorminor
  python setup.py build --fmil-home=/usr/

  cd "${srcdir}"/PyFMI-$_majorminor-py2
  python2 setup.py build --fmil-home=/usr/
}

package_python-pyfmi() {
  depends=('fmilib' 'python-scipy' 'python-lxml' 'python-assimulo')

  cd "${srcdir}"/PyFMI-$_majorminor
  python setup.py install --root=${pkgdir} --fmil-home=/usr/
}

package_python2-pyfmi() {
  depends=('fmilib' 'python2-scipy' 'python2-lxml' 'python2-assimulo')

  cd "${srcdir}"/PyFMI-$_majorminor
  python2 setup.py install --root=${pkgdir} --fmil-home=/usr/
}

