# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=procmon
pkgver=2.1
pkgrel=3
pkgdesc="Trace syscall activity tool"
arch=('x86_64')
url="https://github.com/microsoft/ProcMon-for-Linux"
license=('MIT')
depends=('gcc-libs' 'libedit' 'libelf' 'ncurses' 'sysinternalsebpf' 'zlib' 'zstd')
makedepends=('cmake' 'clang' 'sqlite')
source=("$pkgname-$pkgver.tar.gz::https://github.com/microsoft/ProcMon-for-Linux/archive/refs/tags/$pkgver.0.0.tar.gz")
sha256sums=('d3601fcbaa08199959054bb83f69874e6e8ce8b137b5724575c64da5cfecbf5b')


build() {
  cd "ProcMon-for-Linux-$pkgver.0.0"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  cmake --build "_build"
}

package() {
  cd "ProcMon-for-Linux-$pkgver.0.0"

  install -Dm755 "_build"/{getsyscalls,procmon} -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/procmon"
}
