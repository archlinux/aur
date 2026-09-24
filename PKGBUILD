# Maintainer: Hein (Warky Devs) <hein@warky.dev>
pkgname=relspec
pkgver=1.0.84
pkgrel=1
pkgdesc="RelSpec is a comprehensive database relations management tool that reads, transforms, and writes database table specifications across multiple formats and ORMs."
arch=('x86_64' 'aarch64')
url="https://git.warky.dev/wdevs/relspecgo"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.zip::$url/archive/v$pkgver.zip")
sha256sums=('a370f0327180385684e30581d4eb21ea3ffe3160d045eb39ca26d1e75df6106a')

build() {
    cd "relspecgo"
    export CGO_ENABLED=0
    go build \
        -trimpath \
        -ldflags "-X 'git.warky.dev/wdevs/relspecgo/pkg/buildinfo.Version=v$pkgver' -X 'git.warky.dev/wdevs/relspecgo/pkg/buildinfo.BuildDate=$(date -u +"%Y-%m-%d %H:%M:%S UTC")'" \
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
