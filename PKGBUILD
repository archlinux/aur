# Maintainer: Fernando Ortiz <nandub+arch@nandub.info>
# Contributor: Michael Beasley <youvegotmoxie@gmail.com>

pkgbase=pypy3-lxml
pkgname=('pypy3-lxml')
pkgver=4.9.2
pkgrel=1
pkgdesc="The lxml XML toolkit is a Pythonic binding for the C libraries libxml2 and libxslt"
license=('BSD')
arch=('i686' 'x86_64')
makedepends=('libxslt' 'pypy3' 'pypy3-setuptools')
url="http://lxml.de/"
source=(https://pypi.python.org/packages/source/l/lxml/lxml-${pkgver}.tar.gz)
sha256sums=('2455cfaeb7ac70338b3257f41e21f0724f4b5b0c0e7702da67ee6c3640835b67')

build() {
  # build for pypy3
  cd lxml-$pkgver

  pypy3 setup.py build
}

package_pypy3-lxml() {
  depends=('pypy3' 'libxslt')
  pkgdesc+=" for Pypy 3"

  cd lxml-$pkgver

  pypy3 setup.py install --prefix=/opt/pypy3 --root="$pkgdir" --optimize=1
  install -Dm644 LICENSES.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
