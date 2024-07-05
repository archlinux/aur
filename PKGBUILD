# Maintainer: None
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-sparqlwrapper
pkgver=2.0.0
pkgrel=1
pkgdesc="SPARQL Endpoint interface to Python"
arch=('any')
url="https://rdflib.github.io/sparqlwrapper/"
license=('W3C')
depends=('python' 'python-rdflib>=6.1.1')
makedepends=('python-setuptools')
optdepends=('python-pandas>=1.3.5: to use sparql_dataframe')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RDFLib/sparqlwrapper/archive/$pkgver.tar.gz")
sha512sums=('6d1b684822ec587771342c2a21df01e306b5bd9b248ca075c6d060f51a831976d54449c8305c9f67fe2b9922ff77c38565555956ae9ed324bda11553932d86a0')

build() {
  cd "$srcdir"/sparqlwrapper-$pkgver
  python setup.py build
}

check() {
  cd "$srcdir"/sparqlwrapper-$pkgver
  python -m unittest test/test_wrapper.py -v
}

package() {
  cd sparqlwrapper-$pkgver
  LC_CTYPE=en_US.UTF-8 python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
