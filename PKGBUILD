# Maintainer: Krzysztof Demir Kuźniak <krzysztofdemirkuzniak@gmail.com>
pkgname=x86_64-lfs-linux-gnu-binutils-pass1
pkgver=2.45
pkgrel=1
pkgdesc="Binutils (assembler, linker, etc.) for LFS cross-toolchain (pass 1)"
arch=('x86_64')
url="https://www.gnu.org/software/binutils/"
license=('GPL2')
depends=()
makedepends=('gcc' 'make' 'texinfo')
source=("https://ftp.icm.edu.pl/pub/gnu/binutils/binutils-${pkgver}.tar.xz")
sha256sums=('53ee68eae39d4d3b78812c737c52f2f2b9f1f6f6f0b4f1f9832c4f0f0e7f0d12')

target="x86_64-lfs-linux-gnu"

build() {
  cd "${srcdir}/binutils-${pkgver}"
  mkdir -v build
  cd build

  ../configure \
    --prefix=/usr/${target}-pass1 \
    --with-sysroot=/mnt/lfs \
    --target=${target} \
    --disable-nls \
    --enable-gprofng=no \
    --disable-werror \
    --enable-new-dtags \
    --enable-default-hash-style=gnu

  make
}

package() {
  cd "${srcdir}/binutils-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}
