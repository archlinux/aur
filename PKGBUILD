#!/bin/bash
# Maintainer: Swapnil Ingle <ingleswapnil2004@gmail.com>
pkgname=quazaar
pkgver=0.1.3
pkgrel=1
pkgdesc="A cross-platform LAN media control system using WebSockets"
arch=('x86_64')
url="https://github.com/codershubinc/quazaar"
license=('MIT')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed')

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    go build -o quazaar ./cmd/server
}

package() {
    cd "$pkgname-$pkgver"
    
    # Install the binary
    install -Dm755 quazaar "$pkgdir/usr/bin/quazaar"

    # Install the license (Arch policy requires this)
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
