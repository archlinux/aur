# $Id: PKGBUILD 57440 2011-10-27 20:16:15Z lcarlier $
# Contributor: Hector <hsearaDOTatDOTgmailDOTcom>


pkgbase=python-scripttest
pkgname=('python2-scripttest' 'python-scripttest')
pkgver=1.3
pkgrel=1
pkgdesc='A library to help you test your interactive command-line applications'
url='http://pythonpaste.org/scripttest/'
license=("MIT")
arch=('i686' 'x86_64')
depends=()
optdepends=()
makedepends=('python2-setuptools' 'python-setuptools')
options=('!libtool')
source=("https://pypi.python.org/packages/source/s/scripttest/scripttest-${pkgver}.tar.gz")
sha1sums=('9551db7d23da77199f6137e6ffb6489b66ddf143')

prepare() {
  cd "$srcdir"
  cp -a scripttest-${pkgver} scripttest-py2-${pkgver}
}

build() {
  msg2 "Building mdtraj - Python2"
  cd "${srcdir}/scripttest-py2-${pkgver}"
  python2 setup.py build

  msg2 "Building mdtraj - Python3"
  cd "${srcdir}/scripttest-${pkgver}"
  python setup.py build
}


package_python2-scripttest() {
  depends=()
  msg2 "Installing scripttest python2"
  cd "${srcdir}/scripttest-py2-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  rm -rf ${pkgdir}/usr/bin 

  # Remove left over directories from distribute utils.
  find ${pkgdir} -type d -name "__pycache__" -exec rm -r {} \; -prune
}

package_python-scripttest() {
  depends=()
  msg2 "Installing scripttest python3"
  cd "${srcdir}/scripttest-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

  # Remove left over directories from distribute utils.
  find ${pkgdir} -type d -name "__pycache__" -exec rm -r {} \; -prune
}
