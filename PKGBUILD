# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: Jaroslav Lichtblau <tu@dragonlord.cz>

pkgname=gxmessage-gtk2
_pkgname=gxmessage
pkgver=2.20.4
pkgrel=2
pkgdesc="A GTK2 based xmessage clone for GTK2."
arch=('i686' 'x86_64')
url="https://trmusson.dreamhosters.com/programs.html#gxmessage"
license=('GPL')
depends=('gtk2' 'desktop-file-utils')
makedepends=('pkgconfig' 'intltool')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(https://ftp.gnu.org/gnu/$_pkgname/$_pkgname-$pkgver.tar.gz
        $_pkgname.desktop)
md5sums=('dbef00c5e9dd1fb3463b08044be7ae8e'
         'af92506581c1aae70e3845a66a983f22')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -D -m644 "$srcdir/$_pkgname.desktop" \
    "${pkgdir}/usr/share/applications/$_pkgname.desktop"
}
