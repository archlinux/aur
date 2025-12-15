pkgname=nmrs
pkgver=1.0.0
pkgrel=1
pkgdesc="Wayland-native GUI for NetworkManager, built with Rust and GTK4"
arch=('x86_64')
url="https://github.com/cachebag/nmrs"
license=('MIT')
depends=('gtk4' 'libadwaita' 'networkmanager')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cachebag/nmrs/archive/v0.3.0-beta.tar.gz"
        "nmrs.desktop")
sha256sums=('f9175dfe4dd7c86b585d9218a6953aa2720b7439be31c225b7fee896fff34d7b'
            '2279f157e299d52fabad1dfd9abd9e862b48dbba83921680f5134a537db061ef')

build() {
    cd "$srcdir/${pkgname}-0.3.0-beta"
    cargo build --release --locked
}

package() {
    cd "$srcdir/${pkgname}-0.3.0-beta"
    install -Dm755 "target/release/nmrs-gui" "$pkgdir/usr/bin/nmrs"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/nmrs.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
