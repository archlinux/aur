# Maintainer: ericdahl-dev
pkgname=omarchy-wled
pkgver=0.2.0
pkgrel=1
pkgdesc="Sync Omarchy theme accent or wallpaper color to a WLED device"
arch=('x86_64' 'aarch64')
url="https://github.com/ericdahl-dev/omarchy-wled"
license=('MIT')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5a63821b9805b64f8ebabbea89727d276a577809d9b868f00b290b3d86276001')

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
