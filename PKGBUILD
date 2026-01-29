# Maintainer: Rotko Networks <hq@rotko.net>
pkgname=zish
pkgver=0.10.3
pkgrel=1
pkgdesc="fast shell interpreter written in zig"
arch=('x86_64')
url="https://github.com/rotkonetworks/zish"
license=('MIT')
depends=('glibc')
makedepends=('zig>=0.15.1')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rotkonetworks/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('43e319773e1aba6e7cd26025c162a02093f45b0a6153e6285de58e47c9d0a780')

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
