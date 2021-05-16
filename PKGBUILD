# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-chameleon
pkgver=3.9.1
pkgrel=1
pkgdesc="Fast HTML/XML Template Compiler"
arch=('any')
license=('BSD' 'ZPL')
url="http://www.pagetemplates.org/"
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-zope-testrunner')
source=("https://github.com/malthe/chameleon/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('53b0aeeef89df7cacc299dad20e05023c638e708604876ce5269f22bab00e5001b640123920aef0ef9a0f554bbd37d151bedfdfe55ec161defe6b6f3781d841e')

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
