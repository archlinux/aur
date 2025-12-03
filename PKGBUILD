pkgname=nmrs
pkgver=0.2.0
pkgrel=1
pkgdesc="Wayland-native GUI for NetworkManager, built with Rust and GTK4"
arch=('x86_64')
url="https://github.com/cachebag/nmrs"
license=('MIT')
depends=('gtk4' 'libadwaita' 'networkmanager')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cachebag/nmrs/archive/v$pkgver-beta.tar.gz"
        "nmrs.desktop")
sha256sums=('d219a548a2c3a9188eb76c32bb507233db3c6e832bab327585364341a4bb058f'
            '2279f157e299d52fabad1dfd9abd9e862b48dbba83921680f5134a537db061ef')

build() {
    cd "$srcdir/$pkgname-$pkgver-beta"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname-$pkgver-beta"
    install -Dm755 "target/release/nmrs-ui" "$pkgdir/usr/bin/nmrs"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/nmrs.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
