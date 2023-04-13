# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-sparqlwrapper
pkgver=1.8.5
pkgrel=3
pkgdesc="SPARQL Endpoint interface to Python"
arch=('any')
url="https://rdflib.github.io/sparqlwrapper/"
license=('W3C')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-rdflib-jsonld')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RDFLib/sparqlwrapper/archive/$pkgver.tar.gz")
sha512sums=('7637989bbf883824be5d277d6b0bd2c2ec8b628ded8a103f6da724b62977a5e9bd13f8ec8d9031de5f5028acfcbd599148dbab5ff3694261c1ec27295c34ee38')

build() {
  cd "$srcdir"/sparqlwrapper-$pkgver
  python setup.py build
}

check() {
  cd "$srcdir"/sparqlwrapper-$pkgver
  ./run_tests_py3.sh
}

package() {
  cd sparqlwrapper-$pkgver
  LC_CTYPE=en_US.UTF-8 python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
