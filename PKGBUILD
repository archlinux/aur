pkgbase=python-pyfmi
pkgname=('python-pyfmi' 'python2-pyfmi')
pkgver=2.3.1
pkgrel=1
pkgdesc="A package for working with dynamic models compliant with the FMI standard."
url="http://www.pyfmi.org"
arch=('i686' 'x86_64')
license=('LGPL')
makedepends=('python-setuptools' 'python2-setuptools' 'fmilib' 'cython' 'cython2')
source=("https://pypi.python.org/packages/66/60/26664b2b2cad4a7fae409214e2f8901177322d78bfb11ef61e580115c9b8/PyFMI-${pkgver}.zip")
sha1sums=('b22fa78a8648529c6a12e303255ebad2fbfd43bc')

build() {
  cp -r "${srcdir}"/PyFMI-$pkgver "${srcdir}"/PyFMI-$pkgver-py2

  cd "${srcdir}"/PyFMI-$pkgver
  python setup.py build --fmil-home=/usr/

  cd "${srcdir}"/PyFMI-$pkgver-py2
  python2 setup.py build --fmil-home=/usr/
}

package_python-pyfmi() {
  depends=('fmilib' 'python-scipy' 'python-lxml' 'python-assimulo')

  cd "${srcdir}"/PyFMI-$pkgver
  python setup.py install --root=${pkgdir} --fmil-home=/usr/
}

package_python2-pyfmi() {
  depends=('fmilib' 'python2-scipy' 'python2-lxml' 'python2-assimulo')

  cd "${srcdir}"/PyFMI-$pkgver-py2
  python2 setup.py install --root=${pkgdir} --fmil-home=/usr/
}

