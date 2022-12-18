# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-aesara
_pkgname=aesara
pkgver=2.8.9
pkgrel=2
pkgdesc="Library for defining, optimizing, and efficiently evaluating mathematical expressions involving multi-dimensional arrays"
arch=(any)
url="https://github.com/aesara-devs/aesara"
license=(custom)
makedepends=(python-setuptools)
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
sha256sums=('3ced708aa151b572143bffec08df2f1dd4dab913a9f90925d9e7ca909a72e21c')

_archive="$_pkgname-rel-$pkgver"

build() {
  cd "$_archive"

  python setup.py build
}

package() {
  cd "$_archive"

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 doc/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
