pkgname=nmrs
pkgver=0.4.0_beta
pkgrel=3
pkgdesc="Wayland compatible GUI for NetworkManager, built with Rust and GTK4"
arch=('x86_64')
url="https://github.com/cachebag/nmrs"
license=('MIT')
depends=('gtk4' 'libadwaita' 'networkmanager')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cachebag/nmrs/archive/refs/tags/v0.4.0-beta.tar.gz"
        "nmrs.desktop")
sha256sums=('d5cf299b1e9157bd5ef8a20e093454ac2102ed395dcccca16777f4e3ed267ac9'
            '2279f157e299d52fabad1dfd9abd9e862b48dbba83921680f5134a537db061ef')

build() {
    cd "$srcdir/${pkgname}-0.4.0-beta"
    cargo build --release --locked
}

package() {
    cd "$srcdir/${pkgname}-0.4.0-beta"
    install -Dm755 target/release/nmrs-gui "$pkgdir/usr/bin/nmrs"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/nmrs.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
