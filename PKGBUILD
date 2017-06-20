# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=dns-lexicon
pkgver=2.1.8
pkgrel=1
pkgdesc="Manipulate DNS records on various DNS providers in a standardized/agnostic way"
arch=('any')
url="https://github.com/AnalogJ/lexicon"
license=('MIT')
depends=('python-future' 'python-requests' 'python-setuptools' 'python-tldextract')
checkdepends=('python-pytest-runner' 'python-vcrpy')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AnalogJ/lexicon/archive/v$pkgver.tar.gz")
sha512sums=('5e2ecf272b4d8381d64c1d78b5986a2928dbb45c556280420b2c2e2e596054ee159819f75ba0aba81f5535c1929e2165ed186e48fffadf8bf0502751bff8226a')

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
