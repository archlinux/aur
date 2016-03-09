# $Id: PKGBUILD 57440 2011-10-27 20:16:15Z lcarlier $
# Contributor: Hector <hsearaDOTatDOTgmailDOTcom>


pkgbase=python-numdifftools
pkgname=('python2-numdifftools' 'python-numdifftools')
pkgver=0.9.14
pkgrel=1
pkgdesc='A suite of tools written in _Python to solve automatic numerical differentiation problems in one or more variables.'
url='https://github.com/pbrod/numdifftools/'
license=("LGPL")
arch=('i686' 'x86_64')
depends=('python-numpydoc')
#depends=('python2-numpydoc' 'python-numpydoc')
makedepends=('python2-setuptools' 'python-setuptools')
options=('!libtool')
source=("https://pypi.python.org/packages/source/N/Numdifftools/numdifftools-${pkgver}.zip")
sha1sums=('d99930a9389ff23c044c8b4e7499d76201d8040b') 

prepare() {
  cd "$srcdir"
  cp -a numdifftools-${pkgver} numdifftools-py2-${pkgver}
}

build() {
  msg2 "Building numdifftools - Python2"
  cd "${srcdir}/numdifftools-py2-${pkgver}"
  python2 setup.py build

  msg2 "Building numdifftools - Python3"
  cd "${srcdir}/numdifftools-${pkgver}"
  python setup.py build
}

package_python-numdifftools() {
  depends=('python-numpydoc')
  optdepends=()
  msg2 "Installing numdifftools python3"
  cd "${srcdir}/numdifftools-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

  # Remove left over directories from distribute utils.
  find ${pkgdir} -type d -name "__pycache__" -exec rm -r {} \; -prune
}

package_python2-numdifftools() {
#  depends=('python2-numpydoc')
  optdepends=()
  msg2 "Installing numdifftools python2"
  cd "${srcdir}/numdifftools-py2-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  
  # Remove duplicated documentation
  rm -rf ${pkgdir}/usr/share

  # Remove left over directories from distribute utils.
  find ${pkgdir} -type d -name "__pycache__" -exec rm -r {} \; -prune
}

