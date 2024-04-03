# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Sébastien Leduc <sebastien@sleduc.fr>
# Contributor: Stéphane Marguet (Stemp) <smarguet at gmail dot com>
# Contributor: Olivier Le Moal <mail@olivierlemoal.fr>
# Contributor: Alexandre Chataignon <alexandre@chataignon.net>
# Contributor: Sebastien Duquette <ekse.0x@gmail.com>
# Contributor: Marc Poiroud <marci1@archlinux.fr>

pkgname=verbiste
pkgver=0.1.48
pkgrel=1
pkgdesc="French conjugation system."
url="http://sarrazip.com/dev/verbiste.html"
license=("GPL")
depends=('libxml2')
makedepends=('perl-xml-parser' 'gtk2')
optdepends=('gtk2: for verbiste-gtk')
arch=('i686' 'x86_64')
source=("http://perso.b2b2c.ca/~sarrazip/dev/${pkgname}-${pkgver}.tar.gz")
sha512sums=('4d0ac1a1116b51196b1ba72cceed507c56551ed97d2de07dfbf1f6eb48769a7c3c1ee676aa3a2d3f9e3cb512df3808d9bb1da9c7166a820cc3379ff06f4f14f2')

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
