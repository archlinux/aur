# Maintainer: Pierce Lopez <pierce.lopez@gmail.com>
# Original Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=nsq
pkgver=1.2.1
pkgrel=1
pkgdesc="A realtime distributed messaging platform"
arch=( 'i686' 'x86_64' )
url="http://nsq.io/"
makedepends=( "go" "git" )
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nsqio/nsq/archive/v$pkgver.tar.gz")
sha256sums=('5fd252be4e9bf5bc0962e5b67ef5ec840895e73b1748fd0c1610fa4950cb9ee1')
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
