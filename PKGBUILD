# Maintainer: Rotko Networks <hq@rotko.net>
pkgname=zish
pkgver=0.8.0
pkgrel=1
pkgdesc="fast shell interpreter written in zig"
arch=('x86_64')
url="https://github.com/rotkonetworks/zish"
license=('MIT')
depends=('glibc')
makedepends=('zig>=0.15.1')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rotkonetworks/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('983e138f2b15feaf6fadc0e811d8adb0fd7e60f497fe3f08d0931a484401c5c6')

build() {
    cd "$pkgname-$pkgver"
    zig build -Doptimize=ReleaseFast
}

check() {
    cd "$pkgname-$pkgver"
    zig build test
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "zig-out/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md" 2>/dev/null || true
}
