# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Carl Smedstad <carsme@archlinux.org>

pkgname=python-polyfactory
_pkgname=${pkgname#python-}
pkgver=3.1.0
pkgrel=1
pkgdesc="Simple and powerful factories for mock data generation"
arch=(any)
url="https://github.com/litestar-org/polyfactory"
license=(MIT)
depends=(
  python
  python-attrs
  python-faker
  python-msgspec
  python-pydantic
  python-pydantic-core
  python-pymongo
  python-pytest
  python-sqlalchemy
  python-typing_extensions
)
makedepends=(
  python-build
  python-hatchling
  python-installer
  python-wheel
)
# checkdepends=(
#   python-aiosqlite
#   python-email-validator
#   python-hypothesis
#   python-pytest-asyncio
# )
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d5609473ae7fa18a95d62193ddedfbc1045eeebd5e372cec5fc9c952144443c5')

_archive="$_pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

# check() {
#   cd "$_archive"
#
#   # Deselect failing test
#   pytest tests/ \
#     --deselect tests/constraints/test_int_constraints.py::test_handle_constrained_int_handles_ge_with_le
# }

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
