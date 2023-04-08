# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-chameleon
pkgver=3.10.2
pkgrel=2
pkgdesc="Fast HTML/XML Template Compiler"
arch=('any')
license=('BSD' 'ZPL')
url="https://chameleon.readthedocs.io/"
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-zope-testrunner')
source=("https://github.com/malthe/chameleon/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('a00de545812d25fbaab86a0252b81d47a7e6a6460c6874ab536e6e65a4b56301cd54a31c390c4503453bd4e04863f83e3eec381f69e87b8bb7046943e0a24493')

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
