# Maintainer: Hein (Warky Devs) <hein@warky.dev>
pkgname=relspec
pkgver=1.0.62
pkgrel=1
pkgdesc="RelSpec is a comprehensive database relations management tool that reads, transforms, and writes database table specifications across multiple formats and ORMs."
arch=('x86_64' 'aarch64')
url="https://git.warky.dev/wdevs/relspecgo"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.zip::$url/archive/v$pkgver.zip")
sha256sums=('bc7164834521f5e29876c96a2a790c5962629176f8c8a603b6b5f2dfe02bcb4c')

build() {
    cd "relspecgo"
    export CGO_ENABLED=0
    go build \
        -trimpath \
        -ldflags "-X git.warky.dev/wdevs/relspecgo/cmd/relspec.version=$pkgver" \
        -o "$pkgname" ./cmd/relspec
}

check() {
    cd "relspecgo"
    go test ./...
}

package() {
    cd "relspecgo"

    # Binary
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Default config dir
    install -dm755 "$pkgdir/etc/relspec"
}
