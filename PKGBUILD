# Maintainer: KingofToasters <dev at sgregoratto dot me>
pkgname=cointop
pkgver=1.2.2
pkgrel=1
pkgdesc="An interactive terminal based UI application for tracking cryptocurrencies"
url="https://github.com/miguelmota/cointop"
license=('APACHE')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('go-pie' 'git')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('117b29c9c719faeafaa1d0591a9e63029988ddb09dbe36d095da98c98c80c2e5')

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
  install -Dm644 "$pkgname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
