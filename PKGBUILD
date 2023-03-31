# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Tino Reichardt <milky-archlinux@mcmilk.de>

pkgname=dietlibc
pkgver=0.34
pkgrel=2
pkgdesc="a libc optimized for small size"
arch=('x86_64')
url="https://www.fefe.de/dietlibc/"
license=("GPL")
options=('staticlibs')
validpgpkeys=('878CBE5DA9A50595E674183F15396A7933EB059A'
              '2DEC330151BB9F7DAD8B0BDCFC32CEECA534A9C6')
#source=(http://www.kernel.org/pub/linux/libs/dietlibc/$pkgname-$pkgver.tar.bz2)
source=("https://www.fefe.de/dietlibc/dietlibc-$pkgver.tar.xz"{,.sig})
sha256sums=('7994ad5a63d00446da2e95da1f3f03355b272f096d7eb9830417ab14393b3ace'
            'SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir/usr/bin"
  ln -s /opt/diet/bin/diet "$pkgdir/usr/bin/diet"
}
