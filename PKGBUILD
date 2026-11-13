pkgname=omniorb
pkgver=4.3.5
pkgrel=1
pkgdesc="A CORBA object request broker for C++ and Python."
arch=('x86_64' 'armv7h')
url="http://omniorb.sourceforge.net/"
license=('GPL-2.0-or-later' 'LGPL-2.0-or-later')
depends=('python' 'zstd')
makedepends=('pkgconfig')
source=(http://downloads.sourceforge.net/omniorb/omniORB-${pkgver}.tar.bz2)
sha256sums=('d57c5ec43030b31eeb620b4c8e47d62bf08eab4945dbeab0e094f10c8447bf93')

build() {
  cd "${srcdir}/omniORB-${pkgver}"
  ./configure \
         --prefix=/usr \
         --with-omniORB-config=/etc/omniorb/omniORB.cfg \
         --with-omniNames-logdir=/var/log/omniORB \
         --with-openssl=/usr
  make
}

package() {
  cd "${srcdir}/omniORB-${pkgver}"
  make DESTDIR="${pkgdir}" install
  for i in man/man1/*.1; do
    install -D -m 644 $i "${pkgdir}/usr/share/${i}"
  done
}
