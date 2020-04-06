pkgname=omniorb
pkgver=4.2.4
pkgrel=1
pkgdesc="A CORBA object request broker for C++ and Python."
arch=('x86_64')
url="http://omniorb.sourceforge.net/"
license=('GPL2' 'LGPL2')
depends=('python')
makedepends=('pkgconfig')
source=(http://downloads.sourceforge.net/omniorb/omniORB-${pkgver}.tar.bz2)
sha256sums=('28c01cd0df76c1e81524ca369dc9e6e75f57dc70f30688c99c67926e4bdc7a6f')

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
