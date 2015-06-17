# Maintainer: M0Rf30

pkgname=libevent-fb
pkgver=1.4.14b
pkgrel=2
pkgdesc="An event notification library (for HipHop compiler)"
license=('GPL2')
arch=('i686' 'x86_64')
url="http://www.monkey.org/~provos/libevent/"
depends=('glibc')
provides=(libevent)
source=("http://www.monkey.org/~provos/libevent-$pkgver-stable.tar.gz"
	  libevent-1.4.14.fb-changes.diff)
options=('!libtool')

build() {
  cd $srcdir/libevent-$pkgver-stable
  patch -Np1 -i ../libevent-1.4.14.fb-changes.diff
  sed -i 's#python#python2#' event_rpcgen.py
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
}

package() {
  cd $srcdir/libevent-$pkgver-stable
  make DESTDIR=$pkgdir install
}

md5sums=('a00e037e4d3f9e4fe9893e8a2d27918c'
         'cde91fe8ec39bbed1319e4114417bd7b')

