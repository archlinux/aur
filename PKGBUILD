# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=certomancer
pkgver=0.9.1
pkgrel=5
pkgdesc="Quickly construct, mock & deploy PKI test configurations"
url="https://github.com/MatthiasValvekens/certomancer"
license=(MIT)
arch=(any)
makedepends=(
  python-pytest-runner
  python-wheel
)
checkdepends=(
  python-freezegun
  python-pyhanko-certvalidator
  python-pytest
  python-pytest-aiohttp
  python-pytest-asyncio
  python-pytz
  python-requests
)
depends=(
  python-asn1crypto
  python-click
  python-cryptography
  python-dateutil
  python-importlib-metadata
  python-jinja
  python-oscrypto
  python-python-pkcs11
  python-pyyaml
  python-requests-mock
  python-setuptools
  python-tzlocal
  python-werkzeug
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('fce43c512cb00978ef67e37308e5c20f5e08b4860c13fcee6985b4cacf5fcd55')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  python setup.py build
}

check() {
  cd "$_archive"

  python -m pytest -k 'not test_validate[setup1]'
}

package() {
  cd "$_archive"

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
