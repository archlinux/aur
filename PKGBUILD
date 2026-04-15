# Maintainer: IovAnto <iovine.antonio44@gmail.com>
pkgname=dns-switcher
pkgver=0.2.2
pkgrel=1
pkgdesc="TUI application for real-time DNS switching on Linux"
arch=('x86_64')
url="https://github.com/IovAnto/dns-switcher"
license=('MIT')
depends=('iwd' 'systemd' 'polkit')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/IovAnto/dns-switcher/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cbd149088102e35e670b3cc20849d8af09591095e2f1d0c37fea2ee7f60e8c0f')

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/dns-switcher" "$pkgdir/usr/bin/dns-switcher"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
