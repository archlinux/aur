# Maintainer: Damien Butt <damien at example dot com>
pkgname=emojify-go
pkgver=0.0.1
pkgrel=1
pkgdesc="Lightning-fast Go rewrite of emojify - convert emoji aliases to Unicode emojis"
arch=('x86_64')
url="https://github.com/damienbutt/emojify-go"
license=('MIT')
makedepends=('go')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/damienbutt/emojify-go/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-go-$pkgver"
    export CGO_ENABLED=0
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external"
    go build -o emojify ./cmd/emojify
}

package() {
    cd "$pkgname-go-$pkgver"
    
    # Install binary
    install -Dm755 emojify "$pkgdir/usr/bin/emojify"
    
    # Install license
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    # Install man page
    install -Dm644 docs/man/emojify.1 "$pkgdir/usr/share/man/man1/emojify.1"
}
