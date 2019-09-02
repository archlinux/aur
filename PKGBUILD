# Maintainer: Pierce Lopez <pierce.lopez@gmail.com>
# Original Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=nsq
pkgver=1.2.0
pkgrel=1
pkgdesc="A realtime distributed messaging platform"
arch=( 'i686' 'x86_64' )
url="http://nsq.io/"
makedepends=( "go" "git" )
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nsqio/nsq/archive/v$pkgver.tar.gz")
sha256sums=('98e24d748550f01dd8775e5e40f3ae657f5b513f875a15081cdcdc567b745480')
options=( '!strip' )

build() {
  cd "$srcdir/$pkgname-$pkgver"

  GO111MODULE=on make BLDFLAGS="-ldflags='-s -w'"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR=$pkgdir install
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
