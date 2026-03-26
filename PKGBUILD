# Maintainer: Hanashiko <hlichisper@gmail.com>
pkgname=jwtk
pkgver=0.2.4
pkgrel=1
pkgdesc="CLI/TUI tool for decodeing, validating and generating JWT tokens"
arch=('x86_64')
url="https://github.com/Hanashiko/jwtk"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Hanashiko/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('46a4e7e50629468a74fa0fd53111d69453c9e501e1c5a1fda11468c26d693fba')

build() {
    cd "$pkgname-$pkgver"
    go build -trimpath -buildmode=pie -ldflags="-linkmode=external -extldflags=-Wl,-z,relro,-z,now -s -w" -o "$pkgname" main.go
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
