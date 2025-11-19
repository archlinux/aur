pkgname=i686-elf-binutils-baremetal
pkgver=2.45
pkgrel=1
pkgdesc="GNU Binutils for cross-compiling to i686-elf"
arch=('x86_64')
url="https://www.gnu.org/software/binutils/"
license=('GPL')
makedepends=()
source=("https://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.xz")
sha256sums=('SKIP')

_target=i686-elf
_prefix=/opt/i686-elf

build() {
  cd "$srcdir"
  mkdir -p build-binutils
  cd build-binutils

  ../binutils-$pkgver/configure \
    --target=$_target \
    --prefix=$_prefix \
    --with-sysroot \
    --disable-nls \
    --disable-werror

  make
}

package() {
  cd "$srcdir/build-binutils"
  make DESTDIR="$pkgdir" install
}

