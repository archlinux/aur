# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=procmon
pkgver=2.2.1
pkgrel=1
pkgdesc="Trace syscall activity tool"
arch=('x86_64')
url="https://github.com/microsoft/ProcMon-for-Linux"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++' 'libedit' 'libelf' 'ncurses' 'sysinternalsebpf' 'zlib' 'zstd')
makedepends=('cmake' 'clang' 'sqlite')
source=("$pkgname-$pkgver.tar.gz::https://github.com/microsoft/ProcMon-for-Linux/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7e596d473bcfcb26cad1e04dd8ffc08a32d41a848d10b694b86124a496e7df69')


build() {
  cd "ProcMon-for-Linux-$pkgver"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  cmake --build "_build"
}

package() {
  cd "ProcMon-for-Linux-$pkgver"

  install -Dm755 "_build"/{getsyscalls,procmon} -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/procmon"
}
