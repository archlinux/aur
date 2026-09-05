# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Emil Renner Berthing <aur@esmil.dk>

# Maintainer: SummerBreeze630 <xzwf2003@163.com>

_target=riscv64-unknown-elf
pkgname=$_target-picolibc
pkgver=1.8.12
pkgrel=1
pkgdesc='Fork of newlib with stdio bits from avrlibc'
arch=('i686' 'x86_64')
url='https://github.com/picolibc/picolibc'
license=('BSD')
makedepends=("$_target-gcc" 'meson')
source=("picolibc-$pkgver.tar.xz::$url/releases/download/$pkgver/picolibc-${pkgver}.tar.xz")
sha256sums=('64e8c412e1c40fa6eb1a72d2b5cdbcbfe6ceca4cbea454edbad54557ffc747fa')
options=(!strip !buildflags)

build() {
  meson \
    --prefix="/usr/$_target"/picolibc \
    --cross-file "picolibc-$pkgver/scripts/cross-${_target}.txt" \
    -Dspecsdir="/usr/$_target/lib" \
    -Dsystem-libc=false \
    --buildtype=minsize \
    "picolibc-$pkgver" build

  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/picolibc-$pkgver/COPYING.picolibc"
}

# vim: set ts=2 sw=2 et:

