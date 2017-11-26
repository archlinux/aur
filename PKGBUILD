# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=dns-lexicon
pkgver=2.1.12
pkgrel=1
pkgdesc="Manipulate DNS records on various DNS providers in a standardized/agnostic way"
arch=('any')
url="https://github.com/AnalogJ/lexicon"
license=('MIT')
depends=('python-future' 'python-requests' 'python-setuptools' 'python-tldextract')
optdepends=('python-softlayer: for SoftLayer support'
            'python-boto3: for Route53 support'
            'python-babel: for DNS Made Easy support')
checkdepends=('python-pytest-runner' 'python-vcrpy' 'python-softlayer' 'python-boto3' 'python-babel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AnalogJ/lexicon/archive/v$pkgver.tar.gz")
sha512sums=('42e1477b1dbe123c4c0db52d5aea9b712819208a573c4bf3685901d8b8315d7faf060c37200ed305be0149e98811c683a7cfcae1b775d410d9aa52b5e8d0c80e')

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
