pkgname=nmrs
pkgver=1.1.0
pkgrel=1
pkgdesc="Wayland-native GUI for NetworkManager, built with Rust and GTK4"
arch=('x86_64')
url="https://github.com/cachebag/nmrs"
license=('MIT')
depends=('gtk4' 'libadwaita' 'networkmanager')
makedepends=('cargo' 'git')

source=("$pkgname-$pkgver.tar.gz::https://github.com/cachebag/nmrs/archive/refs/tags/gui-v1.1.0.tar.gz"
        "nmrs.desktop")

sha256sums=('13cecfa92640ba8071ac7cf467be01a12b7ff9ffd3d5db0a8a624bb08e3047e4'
            '41bd0b473eaf0ba62a96f445a9c101f040a9c2fde9b7d277a3b28ac39d3f5dfe')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -Dm755 target/release/nmrs-gui "$pkgdir/usr/bin/nmrs"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/nmrs.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
