# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=dns-lexicon
pkgver=3.11.4
pkgrel=2
pkgdesc="Manipulate DNS records on various DNS providers in a standardized/agnostic way"
arch=('any')
url="https://github.com/AnalogJ/lexicon"
license=('MIT')
depends=('python-beautifulsoup4' 'python-cryptography' 'python-yaml'
         'python-requests' 'python-tldextract' 'python-importlib-metadata')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
optdepends=('python-boto3: for Route53 support'
            'python-localzone: for localzone support'
            'python-softlayer: for SoftLayer support'
            'python-zeep: for Gransy support'
            'python-dnspython: for DDNS support')
            # 'python-oci: for Oracle Cloud Infrastructure (OCI) support'
checkdepends=('python-pytest' 'python-vcrpy' 'python-boto3' 'python-localzone' 'python-softlayer'
              'python-zeep' 'python-dnspython' 'bind')
source=("https://github.com/AnalogJ/lexicon/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('d7c1f085ffcb4589430f744970bbc6793779fb19d4cc29b071937d768cb271330794fccf38b60a82ed6362dda4101ac6643704bb703df242c8f2a17273dc6fbe')

build() {
  cd lexicon-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd lexicon-$pkgver
  pytest --deselect lexicon/tests/providers/test_oci.py
}

package() {
  cd lexicon-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
