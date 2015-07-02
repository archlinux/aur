pkgname=zeromq3
pkgver=3.2.5
pkgrel=1
pkgdesc="Fast messaging system built on sockets, C and C++ bindings.  aka 0MQ, ZMQ."
arch=('i686' 'x86_64')
url="http://www.zeromq.org"
license=('LGPL')
depends=('gcc-libs' 'util-linux')
makedepends=('python2')
conflicts=('zeromq')
source=(http://download.zeromq.org/zeromq-$pkgver.tar.gz
        https://raw.githubusercontent.com/zeromq/cppzmq/1f05e0d11/zmq.hpp)
md5sums=('d4189c152fbdc45b376a30bd643f67fd'
         '6a7b5e04ff4a55c75683aa9fa7ec8e5e')

build() {
  cd "$srcdir/zeromq-$pkgver"
  ./configure prefix=/usr --with-pgm
  sed -i 's/python$/&2/' foreign/openpgm/build-staging/openpgm/pgm/{Makefile,version_generator.py}
  make
}

package() {
  cd "$srcdir/zeromq-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/zmq.hpp" "$pkgdir/usr/include/zmq.hpp"
}
