# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-mirakuru
_name=${pkgname#python-}
pkgver=2.5.2
pkgrel=3
pkgdesc="Start your subprocess and wait for a clear indication that it's running"
arch=(any)
url="https://github.com/ClearcodeHQ/mirakuru"
license=(LGPL3)
depends=(
  python
  python-psutil
)
makedepends=(
  python-build
  python-installer
  python-wheel
)
checkdepends=(
  openbsd-netcat
  procps-ng
  python-daemon
  python-pytest
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('41f01aae0fae2535292d9c6ac3f9f3980f5f96924c41d4d5f9687918788ff6c5')

_archive="$_name-$pkgver"

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
}
