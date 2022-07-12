# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-aesara
_pkgname=aesara
pkgver=2.7.6
pkgrel=1
pkgdesc="Library for defining, optimizing, and efficiently evaluating mathematical expressions involving multi-dimensional arrays"
arch=(any)
url="https://github.com/aesara-devs/aesara"
license=(custom)

makedepends=(python-setuptools)
depends=(
  python-numpy
  python-scipy
  python-filelock
  python-etuples
  python-logical-unification
  python-minikanren
  python-cons
  python-typing_extensions
  openblas
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/rel-${pkgver}.tar.gz")
sha256sums=('a1b6d97b98c9cacb08935ae2329752cfbdb71f5521e732b296cf05ff349ced3f')

build() {
  cd "$_pkgname-rel-$pkgver"

  python setup.py build
}

package() {
  cd "$_pkgname-rel-$pkgver"

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 doc/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
