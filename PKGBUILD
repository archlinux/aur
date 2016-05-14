pkgbase=python-pyfmi
# pkgname=('python-pyfmi' 'python2-pyfmi')
pkgname=('python2-pyfmi')
pkgver=2.2
pkgrel=1
pkgdesc="A package for working with dynamic models compliant with the FMI standard."
url="http://www.pyfmi.org"
arch=('i686' 'x86_64')
license=('LGPL')
makedepends=('python-setuptools' 'python2-setuptools' 'fmilib' 'cython' 'cython2')
source=("https://pypi.python.org/packages/b6/c3/c916efab7c363a6d2a25dd42d4b252ed060c51ad602e6aad8d2e3945638e/PyFMI-${pkgver}.zip")
sha1sums=('6b9d995c9af7d45e5caf1f31fdefc6e0cc25b6bc')

prepare () {
  cd "${srcdir}"/PyFMI-$pkgver

  # seems the enum is unnecessary
  sed -i "s|enum fmi1_status_kind_t|fmi1_status_kind_t|g" src/pyfmi/fmi.c
}

build() {
  cp -r "${srcdir}"/PyFMI-$pkgver "${srcdir}"/PyFMI-$pkgver-py2

#   cd "${srcdir}"/PyFMI-$pkgver
#   python setup.py build --fmil-home=/usr/

  cd "${srcdir}"/PyFMI-$pkgver-py2
  python2 setup.py build --fmil-home=/usr/
}

# package_python-pyfmi() {
#   depends=('fmilib' 'python-scipy' 'python-lxml' 'python-assimulo')
# 
#   cd "${srcdir}"/PyFMI-$pkgver
#   python setup.py install --root=${pkgdir} --fmil-home=/usr/
# }

package_python2-pyfmi() {
  depends=('fmilib' 'python2-scipy' 'python2-lxml' 'python2-assimulo')

  cd "${srcdir}"/PyFMI-$pkgver-py2
  python2 setup.py install --root=${pkgdir} --fmil-home=/usr/
}

