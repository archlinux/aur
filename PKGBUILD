# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=procmon
pkgver=1.0.1
pkgrel=1
pkgdesc="Trace syscall activity tool"
arch=('i686' 'x86_64')
url="https://github.com/microsoft/ProcMon-for-Linux"
license=('MIT')
depends=('glibc' 'clang' 'libedit' 'libelf' 'zlib')
makedepends=('cmake' 'llvm' 'sqlite')
checkdepends=('iperf3' 'netperf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/microsoft/ProcMon-for-Linux/archive/$pkgver.tar.gz")
sha256sums=('f7eb2a81b465b0f17020ade6a962fc195f10033d4e8b6059e9b9ac7337624b3b')


build() {
  cd "ProcMon-for-Linux-$pkgver"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build"
}

package() {
  cd "ProcMon-for-Linux-$pkgver"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/procmon"
}
