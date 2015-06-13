# Maintainer: Maurizio Porrato <maurizio.porrato@gmail.com>

pkgname=janus-gateway-git
pkgver=0.0.9.r0.gf500ae8
pkgrel=2
pkgdesc="WebRTC gateway."
arch=('i686' 'x86_64')
url="http://janus.conf.meetecho.com/"
license=('GPL3')
depends=('libmicrohttpd' 'jansson' 'libnice' 'openssl' 'libsrtp' 'sofia-sip' 'sctp-refimpl-svn' 'libwebsockets-git' 'libevent' 'librabbitmq-c' 'opus' 'libogg' 'glib2' 'ding-libs')
makedepends=('git' 'libtool' 'automake' 'autoconf' 'gcc' 'make' 'pkg-config' 'gengetopt' 'patch')
provides=(janus-gateway)
backup=('etc/janus/janus.cfg')
install=janus-gateway-git.install

source=('git+https://github.com/meetecho/janus-gateway.git')
md5sums=('SKIP')
_gitname="janus-gateway"

pkgver() {
  cd "$srcdir/${_gitname}"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$srcdir/${_gitname}"
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --disable-docs
  DESTDIR="$pkgdir/" make
}

package() { 
  cd "$srcdir/${_gitname}"
  DESTDIR="$pkgdir/" make install configs
  rm -f "$pkgdir/usr/share/janus/certs/mycert.{key,pem}"
} 

