# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-aesara
_name=${pkgname#python-}
pkgver=2.8.10
pkgrel=1
pkgdesc="Library for defining, optimizing, and efficiently evaluating mathematical expressions involving multi-dimensional arrays"
arch=(any)
url="https://github.com/aesara-devs/aesara"
license=(custom)
makedepends=(python-{build,installer,wheel})
depends=(
  python-cons
  python-etuples
  python-filelock
  python-numpy
  python-scipy
  python-sympy
  python-typing_extensions
)
optdepends=(
  'python-numba: for graph transpilation compilation'
  'python-jax: for graph transpilation compilation'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/rel-${pkgver}.tar.gz")
sha256sums=('1668ea3151e9931cd3ddf44ea9147f0fe5554be2a83eb44c82801304eeb14af1')

_archive="$_name-rel-$pkgver"

prepare() {
  cd "$_archive"

  {
    echo "node: ????????????????????????????????????????"
    echo "node-date: ?????????????????????????"
    echo "describe-name: rel-$pkgver"
    echo "ref-names: ???? -> ???, tag: rel-$pkgver"
  } > .git_archival.txt
}

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 doc/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
