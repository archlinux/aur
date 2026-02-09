# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=dealve
pkgver=1.0.1
pkgrel=1
pkgdesc='Delve into game deals from your terminal'
arch=('x86_64' 'aarch64')
url='https://github.com/kurama/dealve-tui'
license=('MIT' 'APACHE')
makedepends=('cargo')
provides=('dealve')
conflicts=('dealve-git' 'dealve-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "$pkgname-$pkgver.tar.gz.asc")
sha256sums=('8e1ad8d8e9f6de41ac166f23411766adb2b7cb178e3ed724ba1a9794ec5e0902'
            'SKIP')
validpgpkeys=('EF4B4CB5DFB8822216A473B1597AB12E66262898')

prepare() {
    cd "dealve-tui-$pkgver"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "dealve-tui-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "dealve-tui-$pkgver"
    install -Dm0755 "target/release/$pkgname" "$pkgdir/usr/bin/jolt"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-APACHE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
