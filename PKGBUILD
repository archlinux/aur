# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=nunc-stans
pkgver=0.1.8
pkgrel=1
pkgdesc="an event framework wrapper"
arch=('i686' 'x86_64')
url="http://directory.fedoraproject.org/"
license=('GPL')
depends=('nspr' 'libevent' 'tevent')
source=("http://directory.fedoraproject.org/sources/$pkgname-$pkgver.tar.bz2")
sha256sums=('66cee78fce36f3a496b454c6cebf7511089a23825207591338bf10178d84dfb5')

build() {
  cd "${pkgname}-${pkgver}"
  
  [ "${CARCH}" == "x86_64" ] && export USE_64=1

  msg2 "Running configure..."
  ./configure --disable-rpath \
              --prefix=/usr \
              --sysconfdir=/etc \
	      --sbindir=/usr/bin \
	      --with-ldapsdk-inc=/usr/include/mozldap \
	      --with-ldapsdk-lib=/usr/lib/mozldap \
              --with-adminutil=/usr

  msg2 "Running make..."
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  
  msg2 "Running make install..."
  make install DESTDIR="${pkgdir}"
}

# vim:set ts=2 sw=2 et:
