# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=dns-lexicon
pkgver=3.25.1
pkgrel=1
pkgdesc="Manipulate DNS records on various DNS providers in a standardized/agnostic way"
arch=(any)
url="https://github.com/dns-lexicon/dns-lexicon"
license=(MIT)
depends=(
  python-beautifulsoup4
  python-cryptography
  python-yaml
  python-requests
  python-requests-unixsocket
  python-tldextract
  python-importlib-metadata
  python-pyotp
  python-dnspython
)
makedepends=(
  git
  python-build
  python-installer
  python-hatchling
)
checkdepends=(
  python-pytest
  python-vcrpy
  python-boto3
  python-localzone
  python-softlayer
  python-zeep
  bind
)
optdepends=(
  'python-boto3: for Route53 support'
  'python-localzone: for localzone support'
  'python-softlayer: for SoftLayer support'
  'python-zeep: for Gransy support')
  # 'python-oci: for Oracle Cloud Infrastructure (OCI) support'
  # 'python-tencentcloud-sdk-python: for QCloud support'
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('12b31063dd1c4305f45763a1e837a27186d1a0ac59b875cc73dfc34fa2171c23ad1c74a72e2c5b431b0c9e9d981147467fd2bbe9b4b7f994a29a303525456deb')
b2sums=('e8915a40f0cc6928bc0eb3518bcceaa7c768d596cf6ac307a920dda4d8b032d887003e0fa0fa69ee6022d3249dd8694352ba2b21eab9478a506d43c8b851ec40')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"

  PYTHONPATH="$PWD/src" pytest
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:
