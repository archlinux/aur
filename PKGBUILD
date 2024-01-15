# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-polyfactory
_name=${pkgname#python-}
pkgver=2.13.0
pkgrel=2
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
checkdepends=(
  python-aiosqlite
  python-email-validator
  python-hypothesis
  python-pytest-asyncio
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('28f26ae4fe205cfde4ac08b220ad8c689063b654c29b7d301210c594fbf003dc')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  pytest tests
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
