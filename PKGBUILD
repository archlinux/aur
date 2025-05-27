# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>
# Contributor: osfans <waxaca@163.com>

_pkgname=marisa
pkgname=mingw-w64-${_pkgname}
pkgver=0.3.0
pkgrel=1
pkgdesc="Static and space-efficient trie data structure library (mingw-w64)"
arch=(any)
url="https://github.com/s-yata/marisa-trie"
license=('LGPL')
makedepends=('git' 'mingw-w64-cmake' 'make')
options=(!strip !buildflags staticlibs)
source=("marisa-trie-$pkgver.tar.gz::https://github.com/s-yata/marisa-trie/archive/v$pkgver.tar.gz")
sha1sums=('baa126ddc6be1c578e32903674911029f4f163c6')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/marisa-trie-$pkgver"
  for _arch in ${_architectures}; do
    ${_arch}-cmake -B build-${_arch} .
    make -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/marisa-trie-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
  done
}
