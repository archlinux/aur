# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=sysinternalsebpf
pkgver=1.4
pkgrel=1
pkgdesc="Sysinternals EBPF"
arch=('i686' 'x86_64')
url="https://github.com/Sysinternals/SysinternalsEBPF"
license=('LGPL-2.1-or-later')
depends=('glibc' 'libelf' 'zstd')
makedepends=('clang' 'cmake')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/Sysinternals/SysinternalsEBPF/archive/refs/tags/$pkgver.0.0.tar.gz")
sha256sums=('43f3e1a4cd40ac0c0d70bf129813f2679064073bd7ca429c06ccac7384f16be5')


build() {
  cd "SysinternalsEBPF-$pkgver.0.0"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    ./
  make -C "_build"
}

check() {
  cd "SysinternalsEBPF-$pkgver.0.0"

  #make -C "_build" test
}

package() {
  cd "SysinternalsEBPF-$pkgver.0.0"

  make -C "_build" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/sysinternalsebpf"
}
