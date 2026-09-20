# Maintainer: taxin-404 <taxin404@duck.com>

pkgname=clickr
pkgver=0.1.1
pkgrel=1
pkgdesc="Fast, lightweight autoclicker for Linux Wayland with TUI interface"
arch=('x86_64' 'aarch64')
url="https://github.com/Wavefire5201/clickr"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('rust')
optdepends=('dunst: desktop notifications'
            'mako: desktop notifications'
            'swaync: desktop notifications'
            'libnotify: desktop notifications')
conflicts=('clickr-git')
install=clickr.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/Wavefire5201/clickr/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cd1b7a0aebc499acca597d564c6f5760166cdc91dadf3b579b2af9739c089376')

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/clickr" "$pkgdir/usr/bin/clickr"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}