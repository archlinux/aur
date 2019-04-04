# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=riscv-pk
pkgver=1.0.0
pkgrel=2
pkgdesc='RISC-V proxy kernel and boot loader'
arch=(x86_64)
url='https://github.com/riscv/riscv-pk'
license=(custom)
depends=(riscv64-linux-gnu-binutils riscv64-linux-gnu-gcc riscv64-linux-gnu-glibc)
makedepends=(git)
groups=(risc-v)
source=("git+$url#commit=97b683ed3cbeeb059e5ad3de8f884db734447d56")
sha256sums=('SKIP')

build() {
  mkdir -p build
  cd build
  export CFLAGS=""
  export RISCV=/usr/riscv64-linux-gnu
  "$srcdir/$pkgname/configure" \
    --prefix=/usr \
    --host=riscv64-linux-gnu \
    --enable-shared \
    --with-gcc \
    --with-gnu-as \
    --with-gnu-ld \
    --bindir=/usr/bin/ \
    --with-sysroot="$RISCV"
  make
}

package() {
  DESTDIR="$pkgdir" PREFIX=/usr make -C build install
}

# vim: ts=2 sw=2 et:
