# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-chameleon
pkgver=3.9.0
pkgrel=1
pkgdesc="Fast HTML/XML Template Compiler"
arch=('any')
license=('BSD' 'ZPL')
url="http://www.pagetemplates.org/"
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-zope-testrunner')
source=("https://github.com/malthe/chameleon/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('72cbd21f083d14b056539c515e43daaca01d923e065b6eca511f4e09486eb8e3fa61d6823dc78cca75f71926050aa04e0f961c9ddd728e15f55408e405f3c7aa')

build() {
  cd chameleon-$pkgver
  python setup.py build
}

check() {
  cd chameleon-$pkgver
  python -m zope.testrunner --path src
}

package() {
  cd chameleon-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
