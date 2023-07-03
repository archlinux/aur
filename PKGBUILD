# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-mirakuru
_name=${pkgname#python-}
pkgver=2.5.1
pkgrel=2
pkgdesc="Start your subprocess and wait for a clear indication that it's running"
arch=(any)
url="https://github.com/ClearcodeHQ/mirakuru"
license=(LGPL3)
depends=(
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

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0bde894d9c39d1a534019c27865af3c2d9d115d10db961640b894d9f3b67b6eb')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  python -m pytest
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
