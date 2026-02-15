# Maintainer: Max van Gent <max.vangent@gmail.com>

pkgname=coq-unimath
pkgver=20250923
pkgrel=1
pkgdesc="Rocq library that formalizes mathematics from a univalent point of view."
arch=('any')
url="https://unimath.github.io/UniMath/"
license=('MIT')
depends=('rocq>=9.0')
makedepends=(
  'dune'
  'ocaml'
  'ocaml-compiler-libs'
  'ocaml-findlib'
  'ocaml-zarith'
  'pango'
)
options=(
  '!debug'
  'staticlibs'
)
source=("https://github.com/UniMath/UniMath/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('f3a4316841de6ccd711ab1f231e23c00fb9e83c9bb7d8e72b5b8cdef02655536c8901635f001a72fcdd7baad13dbe9093365b299ba65e13e4aac9bd36ce28904')

build() {
  cd UniMath-$pkgver
  dune build -p coq-unimath
}

package() {
  cd UniMath-$pkgver
  dune install coq-unimath \
    --prefix=/usr \
    --destdir="$pkgdir" \
    --mandir=/usr/share/man \
    --docdir=/usr/share/doc \
    --libdir=/usr/lib/ocaml
}

