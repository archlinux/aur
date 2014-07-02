# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=xqproxy-git
pkgver=0.1.2.r0.g5e21d36
pkgrel=2
pkgdesc="XDMCP query proxy"
arch=('i686' 'x86_64')
url="http://cgit.freedesktop.org/xqproxy"
license=('MIT')
depends=('bash' 'libx11')
conflicts=('xqproxy')
provides=('xqproxy')
makedepends=('git')
source=("$pkgname::git+https://github.com/bbidulock/xqproxy.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's,([^-]*-g),r\1,;s,-,.,g'
}
prepare() {
  cd $pkgname
  autoreconf -fiv
}
build() {
  cd $pkgname
  ./configure --prefix=/usr
  make V=0
}
package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm755 xqssh "$pkgdir/usr/bin/xqssh"
  install -Dm644 <(head -24 xqproxy.c) "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
