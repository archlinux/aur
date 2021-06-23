# Maintainer: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Brice Carpentier <brice.carpentier@orange.fr>
# Contributoe: Andrew <darkseed2007@yandex.ru>

pkgname=loudmouth-ossl
pkgver=1.5.4
pkgrel=1
pkgdesc="A lightweight Jabber client library written in C/Glib. Build with OpenSSL instead of gnutls"
arch=('x86_64')
license=('LGPL')
url="https://mcabber.com/"
depends=('glib2' 'openssl' 'libidn' 'krb5')
makedepends=('intltool' 'pkgconfig' 'gtk-doc')
conflicts=('loudmouth')
provides=('loudmouth')
source=(https://mcabber.com/files/loudmouth/loudmouth-$pkgver.tar.bz2{,.asc})
sha256sums=('31cbc91c1fddcc5346b3373b8fb45594e9ea9cc7fe36d0595e8912c47ad94d0d'
            'SKIP')
validpgpkeys=('EACADFF156849BC89653139E3C2900DEACB7FC95')

build() {
  cd loudmouth-${pkgver}
  ./configure --prefix=/usr --disable-static --with-compile-warnings=no --enable-gtk-doc --with-ssl=openssl
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd loudmouth-${pkgver}
  make DESTDIR="${pkgdir}" install
}