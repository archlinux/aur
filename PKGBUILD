# Maintainer: yuna0x0 <yuna@yuna0x0.com>
pkgname=obsidian2web-git
pkgver=1.4.0.r48.g4700798
pkgrel=2
pkgdesc="lun-4's obsidian publish knockoff that generates (largely static) websites"
arch=('x86_64' 'aarch64')
url="https://github.com/lun-4/obsidian2web"
license=('MIT')
provides=("obsidian2web=$pkgver-$pkgrel")
conflicts=('obsidian2web')
makedepends=('git' 'anyzig')
source=("$pkgname::git+https://github.com/lun-4/obsidian2web.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    anyzig build -Dtarget="$CARCH-linux-musl" -Dcpu=baseline -Doptimize=ReleaseSafe
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "zig-out/bin/obsidian2web" "$pkgdir/usr/bin/obsidian2web"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
