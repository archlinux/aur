# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Vinay S Shastry <vinayshastry@gmail.com>

pkgname=mp3info
pkgver=0.8.5a
pkgrel=8
pkgdesc="An MP3 technical info viewer and ID3 1.x tag editor"
arch=('x86_64')
url="https://ibiblio.org/mp3info/"
license=('GPL')
depends=('ncurses')
makedepends=('gtk2')
optdepends=('gtk2: run gmp3info GUI')
source=(https://ibiblio.org/pub/linux/apps/sound/mp3-utils/$pkgname/$pkgname-$pkgver.tgz
        gmp3info.desktop)
sha256sums=('0438ac68e9f04947fb14ca5573d27c62454cb9db3a93b7f1d2c226cd3e0b4e10'
            'c2e42945ed41ad97babe4f85c7504bc9be8639aa17466f3723810f4eb615f905')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  sed -i "s:-O2:${CFLAGS}:" Makefile
  sed -i "s:/usr/bin/install:/bin/install:" Makefile

  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  install -d "$pkgdir"/usr/bin "$pkgdir"/usr/share/man/man1
  make prefix="$pkgdir"/usr mandir="$pkgdir"/usr/share/man/man1 install
  install -Dm644 "$srcdir"/gmp3info.desktop "$pkgdir"/usr/share/applications/gmp3info.desktop
}
