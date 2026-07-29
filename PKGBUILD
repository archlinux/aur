# Maintainer: Bryson K <bryson@azin-lang (dot) org>
pkgname=azin
pkgver=0.2.2
pkgrel=1
pkgdesc="Systems programming language"
arch=('x86_64')
url="https://github.com/azin-lang/Azin"
license=('MIT')
depends=('gcc')
optdepends=('clang: alternative backend C compiler')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/azin-lang/Azin/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c9eb786affc32d5bce718439144ff00c4f9e843007fa37fb7dd84f4e5a6a4c1e')

build() {
    cd "Azin-$pkgver"
    export CGO_ENABLED=0
    go build -trimpath -o azc ./cmd/azc
}

check() {
    cd "Azin-$pkgver"
    go run ./cmd/azc -version
}

package() {
    cd "Azin-$pkgver"
    install -Dm755 azc "$pkgdir/usr/bin/azc"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
