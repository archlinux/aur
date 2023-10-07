pkgname=omniorb
pkgver=4.3.1
pkgrel=1
pkgdesc="A CORBA object request broker for C++ and Python."
arch=('x86_64' 'armv7h')
url="http://omniorb.sourceforge.net/"
license=('GPL2' 'LGPL2')
depends=('python')
makedepends=('pkgconfig')
source=(http://downloads.sourceforge.net/omniorb/omniORB-${pkgver}.tar.bz2)
sha256sums=('0f42bc3eb737cae680dafa85b3ae3958e9f56a37912c5fb6b875933f8fb7390d')

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
