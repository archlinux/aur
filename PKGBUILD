# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=certomancer
pkgver=0.9.1
pkgrel=4
pkgdesc="Quickly construct, mock & deploy PKI test configurations"
url="https://github.com/MatthiasValvekens/certomancer"
license=(MIT)
arch=(any)
makedepends=(
  python-setuptools
  python-wheel
  python-pytest-runner
)
checkdepends=(
  python-freezegun
  python-jinja
  python-pyhanko-certvalidator
  python-pytest
  python-pytest-aiohttp
  python-pytest-asyncio
  python-pytz
  python-requests
  python-requests-mock
  python-werkzeug
)
depends=(
  python-asn1crypto
  python-click
  python-dateutil
  python-oscrypto
  python-pyyaml
  python-tzlocal
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
