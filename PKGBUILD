# Maintainer: John-Michael Mulesa <jmulesa@gmail.com>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=grip
pkgver=4.2.4
pkgrel=2
pkgdesc="A cd-player and ripper for the Gnome desktop"
arch=('i686' 'x86_64')
license=('GPL-2.0-or-later')
url="http://sourceforge.net/projects/grip/"
depends=('curl' 'id3lib' 'cdparanoia' 'gtk2')
makedepends=('pkgconfig' 'make')
optdepends=('yelp: to display the help and notices')
source=('id3.patch' http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('4f1699669e04e40b15f641db7ffba1ee54f9c253eb4ddab9085f1cf92d69425c'
            '957bb498b2df717f0ad449a8147d2fa7670796ec91c214cbd3f6d6e40c77ea62')

build() {
  cd ${pkgname}-${pkgver}
  patch -p1 < ../id3.patch
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var CFLAGS="-std=c17 $CFLAGS"
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
