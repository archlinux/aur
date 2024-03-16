# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=certomancer
pkgver=0.12.0
pkgrel=1
pkgdesc="Quickly construct, mock & deploy PKI test configurations"
url="https://github.com/MatthiasValvekens/certomancer"
license=(MIT)
arch=(any)
depends=(
  python
  python-asn1crypto
  python-click
  python-cryptography
  python-dateutil
  python-jinja
  python-python-pkcs11
  python-requests-mock
  python-tzlocal
  python-werkzeug
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
  python-freezegun
  python-pyhanko-certvalidator
  python-pytest
  python-pytest-aiohttp
  python-pytest-asyncio
  python-pytz
  python-requests
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b76d225d6e7e7ef8db305ef2b8ada89801c594312464cb01f9944d63244a8e10')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  pytest
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
