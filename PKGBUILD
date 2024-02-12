pkgname=omniorb
pkgver=4.3.2
pkgrel=1
pkgdesc="A CORBA object request broker for C++ and Python."
arch=('x86_64' 'armv7h')
url="http://omniorb.sourceforge.net/"
license=('GPL-2.0-or-later' 'LGPL-2.0-or-later')
depends=('python')
makedepends=('pkgconfig')
source=(http://downloads.sourceforge.net/omniorb/omniORB-${pkgver}.tar.bz2)
sha256sums=('1c745330d01904afd7a1ed0a5896b9a6e53ac1a4b864a48503b93c7eecbf1fa8')

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
