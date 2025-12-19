pkgname=nmrs
pkgver=1.1.0
pkgrel=1
pkgdesc="Wayland-native GUI for NetworkManager, built with Rust and GTK4"
arch=('x86_64')
url="https://github.com/cachebag/nmrs"
license=('MIT')
depends=('gtk4' 'libadwaita' 'networkmanager')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cachebag/nmrs/archive/v0.3.0-beta.tar.gz"
        "nmrs.desktop")
sha256sums=('c1c7ea585719342edd780b269b84a1866a7f23ae79fec68e9000f9e9fafbd21d'
            '7edd410b32d7dac8db3cfa425fd7bfc48681948e3766991f28de39f6674a082a')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    install -Dm755 "target/release/nmrs-gui" "$pkgdir/usr/bin/nmrs"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/nmrs.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
