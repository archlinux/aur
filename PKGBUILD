# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>
pkgname=omniorb425
pkgver=4.2.5
pkgrel=1
pkgdesc="A CORBA object request broker for C++ and Python. Legacy version."
arch=('x86_64' 'armv7h')
url="http://omniorb.sourceforge.net/"
license=('GPL2' 'LGPL2.1')
depends=('python')
provides=('omniorb=4.2.5')
conflicts=('omniorb')
source=(http://downloads.sourceforge.net/omniorb/omniORB-${pkgver}.tar.bz2)
sha256sums=('f05cf999fb2f4c24c1173b3c44ad97215591d0d1a48d49ac0843c464efe073bb')

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
