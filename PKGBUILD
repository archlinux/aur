# Maintainer: Rotko Networks <hq@rotko.net>
pkgname=zish
pkgver=0.13.0
pkgrel=1
pkgdesc="fast shell interpreter written in zig with built-in AI agent and GGUF inference"
arch=('x86_64')
url="https://github.com/rotkonetworks/zish"
license=('MIT')
depends=('glibc')
makedepends=('zig>=0.15.1')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rotkonetworks/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('a41e9a650f1ec01602d8757a99589ca48175a2778d0f1430e379e6b0c048c199')

build() {
    cd "$pkgname-$pkgver"
    zig build --release=fast
}

check() {
    cd "$pkgname-$pkgver"
    zig build test
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "zig-out/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 zish.1 "$pkgdir/usr/share/man/man1/zish.1"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md" 2>/dev/null || true
}
