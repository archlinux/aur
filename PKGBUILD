# Maintainer: yuna0x0 <yuna@yuna0x0.com>
pkgname=obsidian2web
pkgver=1.4.0
pkgrel=3
pkgdesc="lun-4's obsidian publish knockoff that generates (largely static) websites"
arch=('x86_64')
url="https://github.com/lun-4/obsidian2web"
license=('MIT')
conflicts=('obsidian2web-bin' 'obsidian2web-git')
makedepends=('zig0.12')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lun-4/obsidian2web/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2990e2552a12bf2ec95221b94d04a3eb8432abd2d262cb8adf37471faed65e86')

build() {
    cd "$pkgname-$pkgver"
    zig0.12 build -Dtarget=x86_64-linux-musl -Dcpu=baseline -Doptimize=ReleaseSafe
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "zig-out/bin/obsidian2web" "$pkgdir/usr/bin/obsidian2web"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
