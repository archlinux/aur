# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-mirakuru
_pkgname=${pkgname#python-}
pkgver=2.5.3
pkgrel=1
pkgdesc="Start your subprocess and wait for a clear indication that it's running"
arch=(any)
url="https://github.com/ClearcodeHQ/mirakuru"
license=(LGPL-3.0-only)
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f736d029c6716d3326a2f5178dc68344e41719a8a25237f55eb6579487791bcf')

_archive="$_pkgname-$pkgver"

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
