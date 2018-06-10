# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=dns-lexicon
pkgver=2.4.0
pkgrel=1
pkgdesc="Manipulate DNS records on various DNS providers in a standardized/agnostic way"
arch=('any')
url="https://github.com/AnalogJ/lexicon"
license=('MIT')
depends=('python-future' 'python-requests' 'python-setuptools' 'python-tldextract')
optdepends=('python-softlayer: for SoftLayer support'
            'python-boto3: for Route53 support'
            'python-pynamecheap: for Namecheap support'
            'python-pysimplesoap: for Subreg support')
checkdepends=('python-pytest-runner' 'python-vcrpy' 'python-softlayer' 'python-boto3'
              'python-pynamecheap' 'python-pysimplesoap')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AnalogJ/lexicon/archive/v$pkgver.tar.gz")
sha512sums=('fabf7b24efb4f3e65284dfb894a4aa42b6e1c37dcc38a29bfc3e02c64f070a3284b4bc80f8e23dcc765b5f72a2aed753621af325223e047677e3b0a1dc9c72d7')

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
