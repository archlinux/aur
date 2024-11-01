# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Tino Reichardt <milky-archlinux@mcmilk.de>

pkgname=dietlibc
pkgver=0.35
pkgrel=1
pkgdesc="a libc optimized for small size"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://www.fefe.de/dietlibc/"
license=("GPL-2.0-only")
options=('staticlibs')
validpgpkeys=('950097E47CAF6CF5EB228BADABE0AAAD4637EE30') # Felix von Leitner
source=("https://www.fefe.de/dietlibc/dietlibc-$pkgver.tar.xz"{,.sig})
sha256sums=('5aa5599039ae58bba7b4a1566fc453485cd1a155a20b313e15cd1bd0e19c0beb'
            'SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/usr/bin/" "$pkgdir/usr/man/man1/"

  for bin in "$pkgdir"/opt/diet/bin/*; do
    ln -s /opt/diet/bin/"$(basename "$bin")" -t "$pkgdir/usr/bin/"
  done

  ln -s /opt/diet/man/man1/diet.1 -t "$pkgdir/usr/man/man1/"
}
