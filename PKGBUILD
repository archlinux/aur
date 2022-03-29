pkgname=omniorb
pkgver=4.3.0
pkgrel=1
pkgdesc="A CORBA object request broker for C++ and Python."
arch=('x86_64' 'armv7h')
url="http://omniorb.sourceforge.net/"
license=('GPL2' 'LGPL2')
depends=('python')
makedepends=('pkgconfig')
source=(http://downloads.sourceforge.net/omniorb/omniORB-${pkgver}.tar.bz2)
sha256sums=('976045a2341f4e9a85068b21f4bd928993292933eeecefea372db09e0219eadd')

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
