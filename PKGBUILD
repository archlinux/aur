pkgname=neon-threadsafe
_pkgname=neon
pkgver=0.30.0
pkgrel=1
pkgdesc="HTTP and WebDAV client library with a C interface"
arch=('i686' 'x86_64')
url="http://www.webdav.org/neon/"
license=('GPL' 'LGPL')
depends=('krb5' 'expat' 'ca-certificates')
options=('libtool') # FS#16067
source=("http://www.webdav.org/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('fb60b3a124eeec441937a812c456fd94')
conflicts=('neon')
provides=('neon')

build() {
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr \
    --with-expat \
    --enable-shared \
    --enable-threadsafe-ssl \
    --disable-static \
    --with-ssl=openssl \
    --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
