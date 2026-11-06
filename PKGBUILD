# Maintainer: a821 at mail de
# Contributor: David Runge <dvzrv@archlinux.org>

_name=assertpy
pkgname=python-assertpy
pkgver=2.36.0
pkgrel=1
pkgdesc="Fully typed fluent assertion library for Python"
arch=(any)
url="https://github.com/assertpy/assertpy"
license=(BSD-3-Clause)
depends=(
  python
)
makedepends=(
  python-build
  python-hatchling
  python-installer
  python-wheel
)
optdepends=(
  python-behave
  python-executing
  python-asttokens
  python-idna
  python-jsonpath-ng
  python-jsonschema
  python-referencing
  python-numpy
  python-pandas
  python-polars
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('f7f7ed438a754bda36ff41b277048f3c9caf2b7ab62ca272ceeffec9b37acd0f1d5e1e06bd32c42fa45aa75850f4ff47891c190ec7190fe0a2ef3e18265b7952')
b2sums=('a87e355e1cefabddb6d59b52cf4899cd9cc5c8ce2362a31ad0a7e09aceff264bf758320a032969ddaabd6556fc3d682c06c3e5ea2ef8c766fa5c3c53c0fe2740')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

# check() takes way too long to run, and requires disabling too many
# tests to pass, so I run these locally rather to force users to run them.

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
