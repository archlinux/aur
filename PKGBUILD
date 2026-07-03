# Maintainer: sinbud2004 <sinbud2004@gmail.com>
pkgname=ssh_tunnel_egui
pkgver=0.2.0
pkgrel=1
pkgdesc="SSH Port Forwarding GUI application with GTK4, supporting password and SSH key authentication"
arch=('x86_64')
url="https://github.com/Paul-sinbud2004/ssh-proxy-gtk"
license=('MIT')
depends=('gtk4' 'openssh' 'sshpass')
makedepends=('rust' 'cargo')
source=("ssh-proxy-gtk-$pkgver.tar.gz::https://github.com/Paul-sinbud2004/ssh-proxy-gtk/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "ssh-proxy-gtk-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "ssh-proxy-gtk-$pkgver"
    export RUSTFLAGS="-C opt-level=2"
    cargo build --release --locked --target-dir=target
}

package() {
    cd "ssh-proxy-gtk-$pkgver"
    install -Dm755 "target/release/ssh_proxy_gtk" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

check() {
    cd "ssh-proxy-gtk-$pkgver"
    cargo test --release --locked
}