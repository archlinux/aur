# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-aesara
_pkgname=aesara
pkgver=2.7.7
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
sha256sums=('fafff46d1225b2834c0600f588d5017ce3c863c18905210fdfe9208f72b83bda')

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
