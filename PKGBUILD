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
md5sums=('cb7b619a10a40aaac2113b87bb2b2ea2'
         '70071d6503161a5f466d34ec9649b2fc')

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
