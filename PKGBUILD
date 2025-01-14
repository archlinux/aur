# Maintainer: CloverGit <clovergit@hotmail.com>
# Contributor: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>

pkgname=procdump
pkgver=3.3.0
pkgrel=1
pkgdesc='Generate coredumps based off performance triggers'
arch=(x86_64)
url=https://github.com/Sysinternals/ProcDump-for-Linux
license=(MIT)
depends=(gdb)
makedepends=(clang)
options=(strip !debug)
source=("https://github.com/Sysinternals/ProcDump-for-Linux/archive/$pkgver/ProcDump-for-Linux-$pkgver.tar.gz")
sha256sums=('4d18bf54502b1ae50994c6237439fcec74868cb2324b2213cf67fc4a9bf24e33')

build() {
  cmake -B build -S ProcDump-for-Linux-"$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_FLAGS="-U_FORTIFY_SOURCE" \
    -DCMAKE_CXX_FLAGS="-Wno-error=vla"
  cmake --build build
}

package() {
  #DESTDIR="$pkgdir" cmake --install build
  cd build
  install -Dt "$pkgdir"/usr/bin procdump
  install -Dm644 -t "$pkgdir"/usr/share/doc/procdump changelog
  install -Dm644 -t "$pkgdir"/usr/share/man/man1 procdump.1.gz
}

# vim: set sw=2 ts=2 et:
