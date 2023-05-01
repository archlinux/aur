# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=certomancer
pkgver=0.10.0
pkgrel=1
pkgdesc="Quickly construct, mock & deploy PKI test configurations"
url="https://github.com/MatthiasValvekens/certomancer"
license=(MIT)
arch=(any)
makedepends=(
  python-build
  python-installer
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
  python-jinja
  python-oscrypto
  python-python-pkcs11
  python-pyyaml
  python-requests-mock
  python-tzlocal
  python-werkzeug
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0c2344676293ba8cbb078cc4e5970082df2a9b5f911e3169707ace6fa9c6aa73')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  python -m pytest -k "not test_validate[setup1]"
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
