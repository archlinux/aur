# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=xqproxy
pkgver=0.1.2
pkgrel=2
pkgdesc="XDMCP query proxy"
arch=('i686' 'x86_64')
url="http://cgit.freedesktop.org/xqproxy"
license=('MIT')
depends=('bash' 'libx11')
makedepends=('git')
source=("$pkgname::git+https://github.com/bbidulock/xqproxy.git#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  cd $pkgname
  autoreconf -fiv
}
build() {
  cd $pkgname
  ./configure --prefix=/usr
  make
}
package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm755 xqssh "$pkgdir/usr/bin/xqssh"
  install -Dm644 <(head -24 xqproxy.c) "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
