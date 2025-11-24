# Maintainer: shadowvolt <v3259914@gmail.com>

pkgname=i686-elf-binutils-baremetal
pkgver=2.45
pkgrel=5
pkgdesc="GNU Binutils for cross-compiling to i686-elf (bare metal)"
arch=('x86_64')
url="https://www.gnu.org/software/binutils/"
license=('GPL-3.0-or-later')
install="$pkgname.install"
options=(!debug)

_target=i686-elf
_prefix=/opt/i686-elf

source=("https://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.xz"
        "https://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.xz.sig")
sha256sums=('c50c0e7f9cb188980e2cc97e4537626b1672441815587f1eab69d2a1bfbef5d2'
            'SKIP')
validpgpkeys=('3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F')


build() {
  cd "$srcdir/binutils-$pkgver"
  mkdir -p build
  cd build

  ../configure \
    --target=$_target \
    --prefix=$_prefix \
    --with-sysroot \
    --disable-nls \
    --disable-werror

  make -j"$(nproc)"
}

package() {
  cd "$srcdir/binutils-$pkgver/build"
  make DESTDIR="$pkgdir" install

  rm -f "$pkgdir/$_prefix/share/info/dir"

  rm -rf "$pkgdir/usr/src/debug"
}

provides=("$_target-binutils")
conflicts=("$_target-binutils")

