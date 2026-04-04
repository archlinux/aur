pkgname=ebyt
pkgver=0.1.1
pkgrel=1
pkgdesc="Minimal X11 activity tracker"
arch=('x86_64')
url='https://github.com/barjo/ebyt'
license=('Apache-2.0')
depends=('libx11' 'libxi' 'sqlite')
makedepends=('zig>=0.14.0')
provides=('ebyt')
conflicts=('ebyt-bin')
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/barjo/ebyt/archive/v$pkgver.tar.gz")
sha256sums=('64d311eff4c0ef9f094c321b19265e45189b5c5424e084e14b4c201be77c635a')

build() {
    cd "$pkgname-$pkgver"
    zig build -Doptimize=ReleaseSafe
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 zig-out/bin/ebyt "$pkgdir/usr/bin/ebyt"
    install -Dm644 ebyt.service "$pkgdir/usr/lib/systemd/user/ebyt.service"
}
