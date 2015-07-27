# $Id: PKGBUILD 192310 2013-08-10 01:59:42Z eric $
# Maintainer: Eric Bélanger <eric@archlinux.org>

realpkgname=grip
pkgname=$realpkgname-eject
pkgver=3.3.1
pkgrel=10
pkgdesc="A cd-player and ripper for the Gnome desktop"
arch=('i686' 'x86_64')
license=('GPL')
url="http://sourceforge.net/projects/grip/"
depends=('vte' 'curl' 'libgnomeui' 'id3lib' 'cdparanoia')
optdepends=('yelp: to display the help and notices')
source=(http://downloads.sourceforge.net/sourceforge/${realpkgname}/${realpkgname}-${pkgver}.tar.gz
        grip-3.3.1-invalid-genre-size.patch
	grip-3.3.1-fix-eject.patch
	)
sha1sums=('58ef51fbddf981a189f8b5b39774e3bd6862127d'
          '27057cb49f2abe97045912899965a9bb347612a2'
	  'fc745bc6ba60ed104908edd1be300bba772c7d17')

prepare() {
  cd ${realpkgname}-${pkgver}
  patch -p1 -i "${srcdir}/grip-3.3.1-invalid-genre-size.patch"
  patch -p1 -i "${srcdir}/grip-3.3.1-fix-eject.patch"
  sed -i '/[.] conftest[.]id3/s: c: ./c:' configure
}

build() {
  cd ${realpkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd ${realpkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
