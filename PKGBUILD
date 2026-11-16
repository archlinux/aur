# Maintainer: a821 at mail de
# Contributor: David Runge <dvzrv@archlinux.org>

_name=assertpy
pkgname=python-assertpy
pkgver=2.36.1
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
sha512sums=('d265838a62454dad94afed88c98f41d3810607aea878f3deb90d8164bf604c255655d46b8d9327fe5e4825db49ac9618192ea3354a393369ad863cf94f227418')
b2sums=('86282e8695e8ea5da4bcd6f6d28e37b3eaa9d753b123cc0a821fccb1f5f46e46215aaf9d0e2b375319ab8540dee53a55b0564007c4e81aff0916d13500be24c4')

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
