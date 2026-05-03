# Maintainer: ericdahl-dev
pkgname=omarchy-wled
pkgver=0.2.1
pkgrel=1
pkgdesc="Sync Omarchy theme accent or wallpaper color to a WLED device"
arch=('x86_64' 'aarch64')
url="https://github.com/ericdahl-dev/omarchy-wled"
license=('MIT')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('88d2c2163d00b32d7bc540bf8a26ad314dfb2abeebb4bf3788a4dc138f5a62e9')

build() {
    cd "$pkgname-$pkgver"
    export CGO_ENABLED=0
    export GOFLAGS="-mod=mod"
    go build -trimpath -ldflags="-s -w -X main.version=$pkgver" -o omarchy-wled .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 omarchy-wled "$pkgdir/usr/bin/omarchy-wled"

    # systemd user service
    install -Dm644 omarchy-wled@.service \
        "$pkgdir/usr/lib/systemd/user/omarchy-wled@.service"
}
