# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Sébastien Leduc <sebastien@sleduc.fr>
# Contributor: Stéphane Marguet (Stemp) <smarguet at gmail dot com>
# Contributor: Olivier Le Moal <mail@olivierlemoal.fr>
# Contributor: Alexandre Chataignon <alexandre@chataignon.net>
# Contributor: Sebastien Duquette <ekse.0x@gmail.com>
# Contributor: Marc Poiroud <marci1@archlinux.fr>

pkgname=verbiste
pkgver=0.1.47
pkgrel=1
pkgdesc="French conjugation system."
url="http://sarrazip.com/dev/verbiste.html"
license=("GPL")
depends=('libxml2')
makedepends=('perl-xml-parser' 'gtk2')
optdepends=('gtk2: for verbiste-gtk')
arch=('i686' 'x86_64')
source=("http://perso.b2b2c.ca/~sarrazip/dev/${pkgname}-${pkgver}.tar.gz")
sha512sums=('cc06d3e4a09b9edf2fe3996f527ae05fa50af909cc5ea6ed830d1b4f5706cf9b29028160cff842a211148e13d736f7e2cb74f10b3c5fd84d93a1038e05a26cbf')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --without-gnome-app
  make
  sed -e 's/Exec=verbiste$/Exec=verbiste-gtk/g' -i src/gnome/verbiste.desktop
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  install -Dm644 src/gnome/verbiste.desktop "$pkgdir/usr/share/applications/verbiste.desktop"
}
