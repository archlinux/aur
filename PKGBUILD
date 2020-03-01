# Maintainer: Lauri Kenttä <lauri.kentta@gmail.com>
pkgname=mingw-w64-gnu-efi
pkgver=3.0.11
pkgrel=3
pkgdesc="Library for building UEFI Applications using GNU toolchain (mingw-w64)"
arch=('any')
url="https://sourceforge.net/projects/gnu-efi/"
license=('BSD')
makedepends=('mingw-w64-gcc' 'make')
options=(!strip staticlibs !buildflags)
source=(https://downloads.sourceforge.net/project/gnu-efi/gnu-efi-$pkgver.tar.bz2)
sha256sums=('f28da792a2532e91e18e0101468811739a22cde9eee5eacfd0efb9bf3a61d6b9')

build() {
  cd $srcdir/gnu-efi-$pkgver
  CFLAGS="-fdebug-prefix-map=$PWD=."
  CFLAGS="$CFLAGS" make ARCH=x86_64 CC=x86_64-w64-mingw32-gcc lib
  CFLAGS="$CFLAGS" make ARCH=ia32 CC=i686-w64-mingw32-gcc lib
}

package() {
  mkdir -p $pkgdir/usr/{x86_64,i686}-w64-mingw32/{include,lib}

  cp -a $srcdir/gnu-efi*/inc $pkgdir/usr/x86_64-w64-mingw32/include/efi
  cp -a $srcdir/gnu-efi*/x86_64/lib/libefi.a $pkgdir/usr/x86_64-w64-mingw32/lib/libefi.a

  cp -a $srcdir/gnu-efi*/inc $pkgdir/usr/i686-w64-mingw32/include/efi
  cp -a $srcdir/gnu-efi*/ia32/lib/libefi.a $pkgdir/usr/i686-w64-mingw32/lib/libefi.a
}
