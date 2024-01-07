# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-icontract
_name=${pkgname#python-}
pkgver=2.6.6
pkgrel=1
pkgdesc="Design-by-contract in Python3 with informative violation messages and inheritance"
arch=(any)
url="https://github.com/Parquery/icontract"
license=(MIT)
depends=(
  python
  python-asttokens
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  mypy
  python-astor
  python-asyncstdlib
  python-deal
  python-dpcontracts
  python-numpy
  python-pytest
  python-typeguard
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a4cf6454197af6f12e8a74a86097f0fd71dff20a28d6d96115fe070b4f0aa1a6')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  pytest \
    --deselect tests/test_globals.py::TestSlow::test_slow_set
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
