# Maintainer: Sebastian Stark <sstark+aur@mailbox.org>
pkgname=nerdshade
pkgver=1.4.0
pkgrel=1
pkgdesc="hyprsunset client to smoothly transition color temperature during sunrise/sunset"
arch=("x86_64")
url="https://github.com/sstark/nerdshade"
license=('MIT')
depends=('hyprsunset' 'hyprland')
makedepends=('git' 'go>=1.24')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sstark/nerdshade/archive/refs/tags/rel-$pkgver.tar.gz")
sha256sums=('1fcbd869e3881ca6b5bf60b92f16b23e7361ebac4da77e2ed09495ac7c667120')
_commit=("7f228434031b90e2cfb4f85d5ea65e3ce2e1b74c")

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    cd "$pkgname-rel-$pkgver"
    GOARCH=amd64 GOOS=linux go build -o nerdshade .
}

package() {
    cd "$pkgname-rel-$pkgver"
    install -vDm755 -t "$pkgdir/usr/bin" nerdshade
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
