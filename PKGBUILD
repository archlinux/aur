# Maintainer: Hein (Warky Devs) <hein@warky.dev>
pkgname=relspec
pkgver=1.0.65
pkgrel=1
pkgdesc="RelSpec is a comprehensive database relations management tool that reads, transforms, and writes database table specifications across multiple formats and ORMs."
arch=('x86_64' 'aarch64')
url="https://git.warky.dev/wdevs/relspecgo"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.zip::$url/archive/v$pkgver.zip")
sha256sums=('a41cdfe22e64b1a853862f1711c6dd29af0d432c0c50a320758c0d940fcf0620')

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
