# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=nsq
pkgver=0.3.5
pkgrel=2
pkgdesc="A realtime distributed messaging platform"
arch=( 'i686' 'x86_64' )
url="https://bitly.github.io/nsq/"
makedepends=( "go-gpm" )
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bitly/nsq/archive/v$pkgver.tar.gz")
sha256sums=('4120ad24e3700be1e65549b9a55eab5d4e744cd114d9b39779a47b6dedda0b35')

package() {
  cd "$srcdir/nsq-${pkgver}"
  export GOPATH=$PWD/go
  mkdir -p go
  go-gpm install
  go get github.com/bitly/nsq/...
  make
  sed -i"" 1d Makefile
  make PREFIX=$pkgdir/usr install
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
