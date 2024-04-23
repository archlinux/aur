# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Shane Stone <shanewstone at gmail>

pkgname=proselint
_pkgname=${pkgname#python-}
pkgver=0.14.0
pkgrel=1
pkgdesc="A linter for prose"
arch=(any)
url="https://github.com/amperser/proselint"
license=(BSD-3-Clause)
depends=(
  python
  python-click
)
makedepends=(
  python-build
  python-installer
  python-poetry
  python-wheel
)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('f3076f88a0a1d79d097ef5da395e4dddede8f8db3b5175be1e30bcf4fab90eda')

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

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
