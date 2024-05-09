# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=python-pyhanko
_pkgname=pyHanko
pkgver=0.25.0
pkgrel=1
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
  python-xsdata
  python-yaml
)
makedepends=(
  python-build
  python-installer
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
  'python-barcode: for image support'
  'python-defusedxml: to use XMP'
  'python-fonttools: to use OpenType fonts'
  'python-uharfbuzz: to use OpenType fonts'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('427a1256f14d5bb53a31d26fb648c3d6031f31f776545094933626803523f1ad')

_archive="$_pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  pytest \
    --ignore pyhanko_tests/test_csc.py
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
