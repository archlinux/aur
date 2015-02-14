# Maintainer: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Peter Baldwin <bald_pete@hotmail.com>
# Contributor: Matěj Týč <matej.tyc@gmail.com>

pkgname=pnm2ppa
pkgver=1.13
pkgrel=1
pkgdesc="Ghostscript print filter for owners of HP DeskJet 710C, 712C, 720C, 722C, 820Cse, 820Cxi, 1000Cse, or 1000Cxi printers."
arch=('i686' 'x86_64')
url="http://pnm2ppa.sourceforge.net/"
license=('GPL')
depends=(ghostscript cups glibc foomatic-filters)
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=(5354e54ade6de7a35370e5b47030274c)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  mkdir -p $pkgdir/usr/share/cups/model/
  cd "$startdir"
  cp HP-DeskJet_{1000C,710C,712C,720C,722C,820C}-pnm2ppa.ppd $pkgdir/usr/share/cups/model/
}