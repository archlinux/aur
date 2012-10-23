# Maintainer: Marti Raudsepp <marti@juffo.org>

pkgbase=pypy-lxml
pkgname=('pypy-lxml')
pkgver=3.0.1
pkgrel=1
arch=('i686' 'x86_64')
license=('BSD' 'custom')
url="http://lxml.de/"
makedepends=('pypy' 'libxslt')
source=(http://pypi.python.org/packages/source/l/lxml/lxml-${pkgver}.tar.gz{,.asc})
sha1sums=('bb7fa04e1a49091151608df347cf12e10e9ed7f1'
          '1d6f08dcdd860c3a52664af9fa3de35a47ca4f16')

check() {
  cd lxml-$pkgver

  # CFLAGS passing is broken in PyPy distutils?
  export CFLAGS=-O2
  export CXXFLAGS=-O2
  # Tests are still broken...
  #make PYTHON=pypy test
}

package_pypy-lxml() {
  pkgdesc="PyPy binding for the libxml2 and libxslt libraries (EXPERIMENTAL!)"
  depends=('pypy' 'libxslt')
  #optdepends=('python2-beautifulsoup3: support for parsing not well formed HTML')

  # CFLAGS passing is broken in PyPy distutils?
  export CFLAGS=-O2
  export CXXFLAGS=-O2

  cd lxml-$pkgver
  pypy setup.py install --root="${pkgdir}" --optimize=1
 
  install -Dm644 LICENSES.txt \
    "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 doc/licenses/BSD.txt \
    "${pkgdir}"/usr/share/licenses/$pkgname/BSD.txt
  install -Dm644 doc/licenses/elementtree.txt \
    "${pkgdir}"/usr/share/licenses/$pkgname/elementtree.txt
}

