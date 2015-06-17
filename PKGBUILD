# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Caleb Jacobs <caleb.jacobs@gmail.com>
pkgname=matwm2
pkgver=0.1.2pre3
pkgrel=1
pkgdesc="A nice tiling or floating window manager"
arch=('i686' 'x86_64')
url="http://squidjam.com/matwm/"
license=('MIT')
depends=('libxinerama' 'libxft')
source=(http://www.squidjam.com/matwm/pub/${pkgname}-${pkgver}.tar.gz
	$pkgname.desktop)
md5sums=('7e043ac26ea6c8b29fa7119825ba488d'
         '8b9993b93fe1d5337b631165db7252c9')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd $pkgname-$pkgver
  make PREFIX="$pkgdir/usr" MANDIR="$pkgdir/usr/share/man" install
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/xsessions/$pkgname.desktop"
}
