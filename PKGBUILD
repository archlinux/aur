# Maintainer: Sebastian Stark <sstark+aur@mailbox.org>
pkgname=nerdshade
pkgver=1.1.1
pkgrel=2
pkgdesc="hyprsunset client to smoothly transition color temperature during sunrise/sunset"
arch=("x86_64")
url="https://github.com/sstark/nerdshade"
license=('MIT')
depends=('hyprsunset' 'hyprland')
makedepends=('git' 'go>=1.24')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sstark/nerdshade/archive/refs/tags/rel-$pkgver.tar.gz")
sha256sums=('a5f48a7d6ff3a9267e0a50025e8d1d522b263f109b3d6090f7d7e3259c8445cd')
_commit=("438d73213aa50977a37aa57d2edf7a0bb64644c9")

build() {
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    cd "$pkgname-rel-$pkgver"
    CGO_ENABLED=0 GOARCH=amd64 GOOS=linux go build -o nerdshade .
}

package() {
    cd "$pkgname-rel-$pkgver"
    install -vDm755 -t "$pkgdir/usr/bin" nerdshade
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
