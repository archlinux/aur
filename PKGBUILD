# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=procmon
pkgver=2.0
pkgrel=2
pkgdesc="Trace syscall activity tool"
arch=('x86_64')
url="https://github.com/Sysinternals/ProcMon-for-Linux"
license=('MIT')
depends=('glibc' 'clang' 'libedit' 'libelf' 'ncurses' 'sysinternalsebpf' 'zlib' 'zstd')
makedepends=('cmake' 'llvm' 'sqlite')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Sysinternals/ProcMon-for-Linux/archive/refs/tags/$pkgver.0.0.tar.gz")
sha256sums=('1967dc1e378263902a14408468506d7e39f6a4fedbb38b8c48fb2b2d94f56496')


build() {
  cd "ProcMon-for-Linux-$pkgver.0.0"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build"
}

package() {
  cd "ProcMon-for-Linux-$pkgver.0.0"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/procmon"
}
