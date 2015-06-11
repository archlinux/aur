# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=xqproxy
pkgver=0.1.2
pkgrel=4
pkgdesc="XDMCP query proxy"
arch=('i686' 'x86_64')
#url="http://cgit.freedesktop.org/xqproxy"
url="https://github.com/bbidulock/xqproxy"
license=('MIT')
depends=('bash' 'libx11')
makedepends=('git')
source=("https://github.com/bbidulock/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('906ce26fe99045457b59e33bfe84df5c')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}
package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm755 xqssh "$pkgdir/usr/bin/xqssh"
  install -Dm644 <(head -24 xqproxy.c) "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
