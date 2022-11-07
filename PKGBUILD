# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-aesara
_pkgname=aesara
pkgver=2.8.8
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
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/rel-${pkgver}.tar.gz")
sha256sums=('180dce70c7b1a7f3bf3abe3fa377a0dca05a78505215080c5ee62457c0891c1b')

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
