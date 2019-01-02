# Maintainer: KingofToasters <themanhimself at sgregoratto dot me>
pkgname=cointop
pkgver=1.1.2
pkgrel=1
pkgdesc="An interactive, real-time cryptocurrency monitor"
url="https://github.com/miguelmota/cointop"
license=('APACHE')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('go-pie' 'git')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('69070f6b610f31f64245052910b4bd940a3e722f7326e7959c95f47ebe1c38ba')

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
