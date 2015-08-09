# Maintainer : José Wojnacki <jose.wo at gmail dot com>
# Contributor: Marcos Heredia <chelqo at gmail dot com>

pkgname=gnubik
pkgver=2.4.1
pkgrel=1
pkgdesc="The GNUbik program is an interactive, graphical, cube puzzle."
arch=('any')
url="http://www.gnu.org/software/gnubik/"
license=('GPL3')
depends=('guile' 'mesa' 'gtk2' 'gtkglext')
install=${pkgname}.install
source=("ftp://ftp.gnu.org/gnu/gnubik/$pkgname-$pkgver.tar.gz")
md5sums=('62433d6b65d046e7f56fb8b41ea1837c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  #rm $pkgdir/usr/share/icons/hicolor/icon-theme.cache

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dpm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/"

  install -dm755 "$pkgdir/usr/share/doc/$pkgname/"
  install -Dpm644 ABOUT-NLS AUTHORS ChangeLog INSTALL NEWS README TODO "$pkgdir/usr/share/doc/$pkgname/"
}
