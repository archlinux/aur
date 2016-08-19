# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=wmnotify
pkgdesc="dockapp email notification program for POP3 and IMAP4 servers"
pkgver=1.0.1
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.hugovil.com/projet.php?proj=${pkgname}&lang=en_US"
license=("GPL")
depends=('libxpm' 'libsndfile')
source=("http://www.hugovil.com/repository/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('fc6a6d981ac75180a8113a3af60e498f')

prepare() {
  cd ${pkgname}-${pkgver}
  sed -i -e 's,inline void,void,;t' src/common.h
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
}
