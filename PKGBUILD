# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=python-pyhanko
_name=pyHanko
pkgver=0.19.0
pkgrel=2
pkgdesc="Tools for stamping and signing PDF files"
url="https://github.com/MatthiasValvekens/pyHanko"
license=(MIT)
arch=(any)
depends=(
  python
  python-aiohttp
  python-asn1crypto
  python-click
  python-cryptography
  python-dateutil
  python-oscrypto
  python-pillow
  python-pyhanko-certvalidator
  python-python-pkcs11
  python-qrcode
  python-requests
  python-tzlocal
  python-yaml
)
makedepends=(
  python-build
  python-installer
  python-pytest-runner
  python-setuptools
  python-wheel
)
checkdepends=(
  certomancer
  python-barcode
  python-defusedxml
  python-fonttools
  python-freezegun
  python-pytest
  python-pytest-aiohttp
  python-pytest-asyncio
  python-requests-mock
  python-uharfbuzz
)
optdepends=(
  'python-uharfbuzz: to use OpenType fonts'
  'python-fonttools: to use OpenType fonts'
  'python-defusedxml: to use XMP'
  'python-barcode: for image support'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cc7baf37a7dbe926cb8950e210fb0cb80261a79fa22df690a09271847b1bd4a7')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  python -m pytest \
    --ignore pyhanko_tests/test_csc.py \
    --ignore pyhanko_tests/test_tsa_fetcher.py
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
