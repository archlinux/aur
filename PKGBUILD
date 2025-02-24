# Maintainer:  Anton Kudelin <kudelin at proton dot me>

_pyname=pyarrow-stubs
pkgname=python-$_pyname
pkgver=17.17
pkgrel=1
pkgdesc=' Type annotations for pyarrow'
arch=(any)
url='https://github.com/zen-xu/pyarrow-stubs'
license=(BSD-2-Clause)
depends=(python-pyarrow)
makedepends=(python-build python-installer python-hatchling)
checkdepends=(python-pytest)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('f116a40ca2fcc81d1412579f7f9c396e8e2a6bc1dcab3720555cce2fb056b1b8')

build() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m build \
    --wheel \
    --no-isolation \
    --skip-dependency-check
}

package() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m installer \
    --destdir="$pkgdir" \
    --compile-bytecode=2 \
    dist/*.whl
}
