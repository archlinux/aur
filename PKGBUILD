#Maintainer: Sébastien Leduc <sebastien@sleduc.fr>
#Contributor: Stéphane Marguet (Stemp) <smarguet at gmail dot com>
#Contributor : Olivier Le Moal <mail@olivierlemoal.fr>
#Contributor: Alexandre Chataignon <alexandre@chataignon.net>
#Contributor: Sebastien Duquette <ekse.0x@gmail.com>
#Contributor: Marc Poiroud <marci1@archlinux.fr>
pkgname=verbiste
pkgver=0.1.43
pkgrel=1
pkgdesc="Verbiste is a French conjugation system."
url="http://sarrazip.com/dev/verbiste.html"
license=("GPL")
depends=('libxml2' 'gtk2')
makedepends=('libgnomeui' 'perl-xml-parser')
arch=('i686' 'x86_64')
install=${pkgname}.install
source=("http://perso.b2b2c.ca/~sarrazip/dev/${pkgname}-${pkgver}.tar.gz")
md5sums=('0271dd2d1feafecf75c5c2e892db3858')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --with-gtk-app
# ./configure --prefix=/usr # console support only
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  # Modify location for .desktop file
  install -Dm 644 "$srcdir/$pkgname-$pkgver/src/gnome/verbiste.desktop" \
		  "$pkgdir/usr/share/applications/verbiste.desktop"
  sed -e 's/Exec=verbiste/Exec=verbiste-gtk/g' -i "$pkgdir/usr/share/applications/verbiste.desktop"
}
