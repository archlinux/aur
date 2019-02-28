# Maintainer: KingofToasters <dev at sgregoratto dot me>
pkgname=cointop
pkgver=1.1.3
pkgrel=1
pkgdesc="An interactive, real-time cryptocurrency monitor"
url="https://github.com/miguelmota/cointop"
license=('APACHE')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('go-pie' 'git')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('a9438b1a924a4c685c6c5102cf64988ff9ce773a0abb60009409a426a7112ad0')

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
