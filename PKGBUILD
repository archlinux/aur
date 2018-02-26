# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=dns-lexicon
pkgver=2.1.20
pkgrel=1
pkgdesc="Manipulate DNS records on various DNS providers in a standardized/agnostic way"
arch=('any')
url="https://github.com/AnalogJ/lexicon"
license=('MIT')
depends=('python-future' 'python-requests' 'python-setuptools' 'python-tldextract')
optdepends=('python-softlayer: for SoftLayer support'
            'python-boto3: for Route53 support'
            'python-pynamecheap: for Namecheap support')
checkdepends=('python-pytest-runner' 'python-vcrpy' 'python-softlayer' 'python-boto3'
              'python-pynamecheap')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AnalogJ/lexicon/archive/v$pkgver.tar.gz")
sha512sums=('b72813cb249b97b0cc7aaa16d4bbc2eac8d3385cfc073886b5f42e824d6ca8bfec671e16c4625089336853e841b71a37178ae264ae93ad41908136c86dfbbdb0')

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
