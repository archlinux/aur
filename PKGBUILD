# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Shane Stone <shanewstone at gmail>

pkgname=proselint
_name=${pkgname#python-}
pkgver=0.13.0
pkgrel=4
pkgdesc="A linter for prose"
arch=(any)
url="https://github.com/amperser/proselint"
license=(custom:BSD-3-Clause)
depends=(
  python
  python-click
  python-future
)
makedepends=(
  python-build
  python-installer
  python-poetry
  python-wheel
)
checkdepends=(python-pytest)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('019783cb13a5b6546389764bdd2e505648063315b4307113ff8a93d03bde62e4')

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

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
