# Maintainer: Jiuyang Liu <liujiuyang1994@gmail.com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Paulo Matos <paulo@matos-sorge.com>
# Contributor: b4283 <unknown@unknowndomain.com>

pkgname=spike-git
pkgver=r3205.7438d1e6
pkgrel=1
pkgdesc="Spike, a RISC-V ISA Simulator"
arch=(x86_64)
url="https://github.com/riscv/riscv-isa-sim"
license=('BSD')
groups=()
depends=(dtc)
makedepends=('git')
replaces=(spike)
conflicts=(spike)
source=('git+https://github.com/riscv/riscv-isa-sim')
md5sums=('SKIP')
noextract=()

pkgver() {
  cd "$srcdir/riscv-isa-sim"
  git submodule update --init --recursive
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/riscv-isa-sim"
  ./configure --prefix=/usr
  make CXXFLAGS+="-ffat-lto-objects"
}

package() {
  cd "$srcdir/riscv-isa-sim"
  make DESTDIR="$pkgdir/" install
}
