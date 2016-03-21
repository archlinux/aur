# Maintainer: Pierce Lopez <pierce.lopez@gmail.com>
# Original Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=nsq
pkgver=0.3.7
pkgrel=1
pkgdesc="A realtime distributed messaging platform"
arch=( 'i686' 'x86_64' )
url="http://nsq.io/"
makedepends=( "go-gpm" "git" "go" )
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bitly/nsq/archive/v$pkgver.tar.gz")
sha256sums=('fb71e28c757dd485b43b9bc75d90eb44ff9166ccb3d8a928c5e655b483da316e')


build() {
  cd "$srcdir"
  export GOPATH=$PWD/go
  NSQIO=$GOPATH/src/github.com/nsqio

  mkdir -p       "$NSQIO"
  mv nsq-$pkgver "$NSQIO/nsq"
  cd             "$NSQIO/nsq"
  go-gpm install
  make PREFIX=/usr
}

package() {
  cd "$srcdir/go/src/github.com/nsqio/nsq"
  make PREFIX=/usr DESTDIR=$pkgdir install
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
