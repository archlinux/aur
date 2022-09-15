# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-chameleon
pkgver=3.10.1
pkgrel=1
pkgdesc="Fast HTML/XML Template Compiler"
arch=('any')
license=('BSD' 'ZPL')
url="https://chameleon.readthedocs.io/"
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-zope-testrunner')
source=("https://github.com/malthe/chameleon/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('e79b261ce6f480358191ff3d23af325c0559e9c0b6be8b2c44d4bb3869fb7e09fa759906933d9b4d6f7107779f19bb225170add73ec3205ddf73b9bdb1bcfb9a')

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
