# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-pytensor
_name=${pkgname#python-}
pkgver=2.11.1
pkgrel=3
pkgdesc="Fork of Aesara -- Library for defining, optimizing, and efficiently evaluating mathematical expressions involving multi-dimensional arrays"
arch=(x86_64)
url="https://github.com/pymc-devs/pytensor"
license=(custom)
conflicts=(python-aesara)
makedepends=(
  python-build
  python-installer
  python-versioneer
  python-wheel
)
depends=(
  cython
  python-cons
  python-etuples
  python-filelock
  python-logical-unification
  python-minikanren
  python-numpy
  python-scipy
  python-typing_extensions
)
optdepends=(
  'python-numba: for graph transpilation compilation'
  'python-jax: for graph transpilation compilation'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/rel-${pkgver}.tar.gz")
sha256sums=('594c1d0239eb24d3d8a283a5e3c6158379879e72f1e6731d494f60519dbb7bab')

_archive="$_name-rel-$pkgver"

prepare() {
  cd "$_archive"

  cp doc/LICENSE.txt LICENSE.txt-copy
  rm -r scripts/ doc/ bin/*.sh
}

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt-copy "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
