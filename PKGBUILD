# Maintainer: Pierce Lopez <pierce.lopez@gmail.com>
# Original Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=nsq
pkgver=1.3.0
pkgrel=1
pkgdesc="A realtime distributed messaging platform"
arch=( 'i686' 'x86_64' )
url="http://nsq.io/"
makedepends=( "go" "git" )
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nsqio/nsq/archive/v$pkgver.tar.gz")
sha256sums=('c6289e295aaa40c8d9651de76e66bc9f23e7f5c40b1cc051ea5901965093e1f0')
options=( '!strip' )

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make -j1 BLDFLAGS="-ldflags='-s -w' -trimpath"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR=$pkgdir install
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
