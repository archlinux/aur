# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=python-pyhanko
_name=pyHanko
pkgver=0.19.0
pkgrel=1
pkgdesc="Tools for stamping and signing PDF files"
url="https://github.com/MatthiasValvekens/pyHanko"
license=(MIT)
arch=(any)
makedepends=(
  python-build
  python-installer
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
  python-requests-mock
  python-uharfbuzz
)
depends=(
  python-aiohttp
  python-click
  python-dateutil
  python-pillow
  python-pyhanko-certvalidator
  python-python-pkcs11
  python-pyyaml
  python-qrcode
  python-tzlocal
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
    --ignore pyhanko_tests/test_csc.py
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
