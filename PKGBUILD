# Maintainer: Hein (Warky Devs) <hein@warky.dev>
pkgname=pgtidy-src
pkgver=1.0.0
pkgrel=1
pkgdesc="PostgreSQL SQL formatter and linter"
arch=('x86_64' 'aarch64')
url="https://git.warky.dev/wdevs/pgtidy"
license=('MIT')
makedepends=('go')
provides=('pgtidy')
conflicts=('pgtidy')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/pgtidy-v$pkgver-source.tar.gz")
sha256sums=('f86db1a39becb8826adabc9a1a80f697d9106471be0050463c4de4b55b0de379')

build() {
    cd "pgtidy-$pkgver"
    export CGO_ENABLED=0
    go build \
        -trimpath \
        -ldflags "-X main.version=v$pkgver" \
        -o pgtidy ./cmd/pgtidy
}

check() {
    cd "pgtidy-$pkgver"
    go test ./...
}

package() {
    cd "pgtidy-$pkgver"
    install -Dm755 "pgtidy" "$pkgdir/usr/bin/pgtidy"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
