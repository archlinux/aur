# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=python-pyhanko
_name=pyHanko
pkgver=0.17.0
pkgrel=2
pkgdesc="Tools for stamping and signing PDF files"
url="https://github.com/MatthiasValvekens/pyHanko"
license=(MIT)
arch=(any)
makedepends=(python-setuptools)
checkdepends=(
  certomancer
  python-aiohttp
  python-barcode
  python-fonttools
  python-freezegun
  python-pytest
  python-pytest-aiohttp
  python-python-pkcs11
  python-requests-mock
  python-uharfbuzz
  python-defusedxml
)
depends=(
  python-click
  python-pyhanko-certvalidator
  python-pytz
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2dbc5ec319092d5426ac3691902f911bf568ae9aa0f1c5f80a5530b8c2bcc75e')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python setup.py build
}

check() {
  cd "$_archive"

  python -m pytest --ignore pyhanko_tests/test_csc.py
}

package() {
  cd "$_archive"

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
