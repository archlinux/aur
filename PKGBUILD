# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-chameleon
pkgver=3.10.0
pkgrel=1
pkgdesc="Fast HTML/XML Template Compiler"
arch=('any')
license=('BSD' 'ZPL')
url="https://chameleon.readthedocs.io/"
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-zope-testrunner')
source=("https://github.com/malthe/chameleon/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('de59a4f1d0243beae91008f93741e9565831ea3b07c3f39e20e15ecc7220711a78bf475844fcaa9dc25f2376b0e937779ca28bd58f7c9b95fa2cf35cc7212117')

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
