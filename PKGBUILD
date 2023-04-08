# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-pytensor
_name=${pkgname#python-}
pkgver=2.11.0
pkgrel=1
pkgdesc="Fork of Aesara -- Library for defining, optimizing, and efficiently evaluating mathematical expressions involving multi-dimensional arrays"
arch=(x86_64)
url="https://github.com/pymc-devs/pytensor"
license=(custom)
conflicts=(python-aesara)
makedepends=(python-{build,installer,wheel,versioneer})
depends=(
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
sha256sums=('9e969f56233fec580cfe000ba58dd698b2a7ba1e27fdebe62d4c1f97c4ce6233')

_archive="$_name-rel-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 doc/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
