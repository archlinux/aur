# Maintainer: KingofToasters <dev at sgregoratto dot me>
pkgname=cointop
pkgver=1.3.0
pkgrel=1
pkgdesc="An interactive terminal based UI application for tracking cryptocurrencies"
url="https://github.com/miguelmota/cointop"
license=('APACHE')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('go-pie' 'git')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('26eb1a8a33d63d88e8db4ed7c1112584c8432b9d53fc594c69cc8d7cd4cc7f79')

build() {
  cd "$pkgname-$pkgver"
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o ctop .
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  install -Dm755 "$pkgname-$pkgver/ctop" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
