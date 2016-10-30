# Maintainer: quomoow <quomoow@gmail.com>
pkgname=neon-threadsafe
_pkgname=neon
pkgver=0.30.1
pkgrel=1
pkgdesc="HTTP and WebDAV client library with a C interface"
arch=('i686' 'x86_64')
url="http://www.webdav.org/neon/"
license=('GPL' 'LGPL')
depends=('krb5' 'expat' 'ca-certificates' 'libproxy' 'zlib')
options=('libtool')
source=("http://www.webdav.org/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
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
md5sums=('231adebe5c2f78fded3e3df6e958878e')
