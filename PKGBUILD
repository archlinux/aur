# Maintainer: Rotko Networks <hq@rotko.net>
pkgname=zish
pkgver=0.6.4
pkgrel=1
pkgdesc="fast shell interpreter written in zig"
arch=('x86_64')
url="https://github.com/rotkonetworks/zish"
license=('MIT')
depends=('glibc')
makedepends=('zig>=0.15.1')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rotkonetworks/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed')

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
