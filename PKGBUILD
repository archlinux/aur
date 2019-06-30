# Maintainer: KingofToasters <dev at sgregoratto dot me>
pkgname=cointop
pkgver=1.3.2
pkgrel=1
pkgdesc="An interactive terminal based UI application for tracking cryptocurrencies"
url="https://github.com/miguelmota/cointop"
license=('APACHE')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('go-pie' 'git')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('f891c6cc6f651d0376fb7cde4cb402feaf2ecd59a78d7bfbf237d03e98e39920')

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
