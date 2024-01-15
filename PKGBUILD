# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-pybrowsers
_name=browsers
pkgver=0.5.2
pkgrel=2
pkgdesc="Python library for detecting and launching browsers"
arch=(any)
url="https://github.com/roniemartinez/browsers"
license=(MIT)
depends=(
  python
  python-pyxdg
  python-typing_extensions
)
makedepends=(
  python-build
  python-installer
  python-poetry
  python-wheel
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('9e7c0127d28b2b4a32810fcdcd6085db265361893dd443de54b5ec92da116e71')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
