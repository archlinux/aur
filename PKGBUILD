# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=dns-lexicon
pkgver=2.1.5
pkgrel=1
pkgdesc="Manipulate DNS records on various DNS providers in a standardized/agnostic way"
arch=('any')
url="https://github.com/AnalogJ/lexicon"
license=('MIT')
depends=('python-future' 'python-requests' 'python-setuptools' 'python-tldextract')
checkdepends=('python-pytest-runner' 'python-vcrpy')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AnalogJ/lexicon/archive/v$pkgver.tar.gz")
sha512sums=('7fe15177b670a07d8578f01a3c4c31f192dac6cc912b6e2e522a5a8f128f509eb87ee8317d833f2507f92a3f781dcee2b23f2d2d5da23a305d94cf7d1362870f')

build() {
  cd lexicon-$pkgver
  python setup.py build
}

check() {
  cd lexicon-$pkgver
  python setup.py pytest --addopts '--ignore tests/providers/test_route53.py --ignore tests/providers/test_transip.py'
}

package() {
  cd lexicon-$pkgver
  python setup.py install -O1 --prefix=/usr --root="$pkgdir"

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
