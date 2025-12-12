pkgname=nmrs
pkgver=0.4.0
pkgrel=1
pkgdesc="Wayland compatible GUI for `NetworkManager`, built with Rust and GTK4"
arch=('x86_64')
url="https://github.com/cachebag/nmrs"
license=('MIT')
depends=('gtk4' 'libadwaita' 'networkmanager')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cachebag/nmrs/archive/v0.4.0-beta.tar.gz"
        "nmrs.desktop")
sha256sums=('ba579e58ef5d13c3711a7de8291dc0b403fa2673ffe47828cb011f053a75eae2'
            '2279f157e299d52fabad1dfd9abd9e862b48dbba83921680f5134a537db061ef')

build() {
    cd "$srcdir/${pkgname}-0.4.0-beta"
    cargo build --release --locked
}

package() {
    cd "$srcdir/${pkgname}-0.4.0-beta"
    install -Dm755 "target/release/nmrs-gui" "$pkgdir/usr/bin/nmrs"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/nmrs.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
