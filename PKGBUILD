# Maintainer: a821 at mail de
# Contributor: David Runge <dvzrv@archlinux.org>

_name=assertpy
pkgname=python-assertpy
pkgver=2.35.0
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
sha512sums=('939a95575077d7bbc4361a6c48ba8be609227b286d34871c2644b362988867ab727a87109643829f3bce46cf2236041db0e7a965123f2417a086fa97fb1bbb16')
b2sums=('b51ade5796ca2722434e48c61f26df43bf7f541a7cd2878cd021cf6c0cc1163cc52752942f879c2ced14d09bda49557595a34b16178528681bcca42888e71b75')

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
