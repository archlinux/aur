# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >

pkgname=python-pyhanko-certvalidator
_name=certvalidator
pkgver=0.20.1
pkgrel=1
pkgdesc="Validates X.509 certificates and paths"
url="https://github.com/MatthiasValvekens/certvalidator"
license=(MIT)
arch=(any)
makedepends=(python-setuptools)
checkdepends=(
  python-aiohttp
  python-freezegun
  python-pytest
  python-pytest-asyncio
)
depends=(
  python-asn1crypto
  python-cryptography
  python-oscrypto
  python-requests
  python-uritools
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('13c4ea7528ba9c0beba67947e23664ec3df7d180819cdc161385f3214fc83dcd')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python setup.py build
}

check() {
  cd "$_archive"

  python -m pytest
}

package() {
  cd "$_archive"

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
