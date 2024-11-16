# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=python-pyhanko-certvalidator
_pkgname=certvalidator
pkgver=0.26.4
pkgrel=1
pkgdesc="Validates X.509 certificates and paths"
url="https://github.com/MatthiasValvekens/certvalidator"
license=(MIT)
arch=(any)
depends=(
  python
  python-aiohttp
  python-asn1crypto
  python-cryptography
  python-oscrypto
  python-requests
  python-uritools
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-freezegun
  python-pytest
  python-pytest-asyncio
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a63f70ee391066e23a457a7ea8c8e0ccff82f31ac947da0300378ddbe99c2cfd')

_archive="$_pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  cd "$_archive"

  pytest
}

package() {
  cd "$_archive"

  python -m installer -d "$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
