# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>
# Contributor: osfans <waxaca@163.com>

_pkgname=marisa
pkgname=mingw-w64-${_pkgname}
pkgver=0.3.1
pkgrel=1
pkgdesc="Static and space-efficient trie data structure library (mingw-w64)"
arch=(any)
url="https://github.com/s-yata/marisa-trie"
license=('LGPL')
makedepends=('git' 'mingw-w64-cmake' 'make')
options=(!strip !buildflags staticlibs)
source=("marisa-trie-$pkgver.tar.gz::https://github.com/s-yata/marisa-trie/archive/v$pkgver.tar.gz")
sha1sums=('f8f33051063433a52ce16bc2643fdb1185297332')

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
