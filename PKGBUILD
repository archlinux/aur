# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=dns-lexicon
pkgver=3.3.0
pkgrel=1
pkgdesc="Manipulate DNS records on various DNS providers in a standardized/agnostic way"
arch=('any')
url="https://github.com/AnalogJ/lexicon"
license=('MIT')
depends=('python-future' 'python-tldextract' 'python-cryptography' 'python-yaml' 'python-setuptools'
         # requests[security] Expanded:
         'python-requests' 'python-pyopenssl' 'python-idna')
optdepends=('python-softlayer: for SoftLayer support'
            'python-boto3: for Route53 support'
            'python-pynamecheap: for Namecheap support'
            'python-zeep: for Subreg support'
            'python-xmltodict: for Plesk support'
            'python-beautifulsoup4: for Henet support'
            'python-localzone: for localzone support')
checkdepends=('python-pytest-runner' 'python-vcrpy' 'python-softlayer' 'python-boto3' 'python-mock'
              'python-pynamecheap' 'python-zeep' 'python-xmltodict' 'python-beautifulsoup4'
              'python-localzone' 'bind-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AnalogJ/lexicon/archive/v$pkgver.tar.gz")
sha512sums=('b37ab98bdf7c58aa400c9d67b8a835af5d1545b7f6fbd36874f0ba8066d6b02f4ce3c3dcea9a0a5ae4449ccf2678b30ccdb75c7c7ca166c91403ff0b3ad4f478')

build() {
  cd lexicon-$pkgver
  python setup.py build
}

check() {
  cd lexicon-$pkgver
  python setup.py pytest --addopts '--ignore lexicon/tests/providers/test_transip.py'
}

package() {
  cd lexicon-$pkgver
  python setup.py install -O1 --prefix=/usr --root="$pkgdir"

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
