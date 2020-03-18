# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=dns-lexicon
pkgver=3.3.18
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
            'python-zeep: for Subreg and Gransy support'
            'python-xmltodict: for Plesk support'
            'python-html5lib: for Hetzner support'
            'python-dnspython: for Hetzner support'
            'python-beautifulsoup4: for Henet, Easyname, GratisDNS and Hetzner support'
            'python-localzone: for localzone support')
checkdepends=('python-pytest-runner' 'python-vcrpy' 'python-softlayer' 'python-boto3' 'python-mock'
              'python-pynamecheap' 'python-zeep' 'python-xmltodict' 'python-beautifulsoup4'
              'python-localzone' 'python-html5lib' 'python-dnspython' 'bind-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AnalogJ/lexicon/archive/v$pkgver.tar.gz")
sha512sums=('dd32ffee1284cbcb470e8570a44f15e9c84196dce8f51c7c708c26eeeeccf301df89df29d2820e0a41b67d8c90f504de34a15b7d0741b429d36f4125306a590e')

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
