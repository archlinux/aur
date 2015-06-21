# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: Sebastien Binet <binet@lblbox>
pkgname=python2-pybindgen
pkgver=0.17.0
pkgrel=2
pkgdesc="A tool to generate Python bindings for C/C++ code"
url="http://pypi.python.org/pypi/PyBindGen"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('python2' 'pygccxml')
makedepends=('waf')
provides=('python2-pybindgen')
conflicts=('python2-pybindgen-bzr')
source=("https://pypi.python.org/packages/source/P/PyBindGen/PyBindGen-${pkgver}.tar.gz"
        "PyLong.patch")
md5sums=('7d8fe2b3b4646c3c1d9e5342b1645f6a'
         '60f5b1d02262c74aabbf2d00c8bf15cd')

build() {
  cd ${srcdir}/PyBindGen-$pkgver

  # Patch for __len__g
  # cf. https://bugs.launchpad.net/pybindgen/+bug/1443379
  patch -p1 < "${srcdir}/PyLong.patch"

  PYTHON=python2 ./waf configure --prefix=/usr
  PYTHON=python2 ./waf
}

#check() {
#  cd ${srcdir}/PyBindGen-$pkgver
#  PYTHON=python2 ./waf check
#}

package() {
  cd ${srcdir}/PyBindGen-$pkgver
  PYTHON=python2 ./waf install --prefix=/usr --destdir=${pkgdir}
}
