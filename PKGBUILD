# Maintainer: Bryson K <bryson@azin-lang (dot) org>
pkgname=azin
pkgver=0.2.1
pkgrel=1
pkgdesc="Systems programming language"
arch=('x86_64')
url="https://github.com/azin-lang/Azin"
license=('MIT')
depends=('gcc')
optdepends=('clang: alternative backend C compiler')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/azin-lang/Azin/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ab266403c5d94cc8e5f7921749087ba40227529e00553e9f32dfeb7fc4ae41d0')

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
