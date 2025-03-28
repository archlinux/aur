# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Sébastien Leduc <sebastien@sleduc.fr>
# Contributor: Stéphane Marguet (Stemp) <smarguet at gmail dot com>
# Contributor: Olivier Le Moal <mail@olivierlemoal.fr>
# Contributor: Alexandre Chataignon <alexandre@chataignon.net>
# Contributor: Sebastien Duquette <ekse.0x@gmail.com>
# Contributor: Marc Poiroud <marci1@archlinux.fr>

pkgname=verbiste
pkgver=0.1.49
pkgrel=2
pkgdesc="French conjugation system."
url="http://sarrazip.com/dev/verbiste.html"
license=("GPL")
depends=('libxml2')
makedepends=('perl-xml-parser' 'gtk2')
optdepends=('gtk2: for verbiste-gtk')
arch=('i686' 'x86_64')
source=("http://sarrazip.com/dev/${pkgname}-${pkgver}.tar.gz")
sha512sums=('d7f9a8e6aa9b82f00b85bc24bbcaabc0d97958b98fbba06bf126a178a747ca07e659c67d00129ad149f96c58f3c965c0c49c899f757b93c38f83d4d7c4ea60d6')

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
