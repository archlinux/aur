# Maintainer: Patrick Fischer <aur at pathin dot me>
pkgname=onset
pkgver=2.0.0
pkgrel=1
pkgdesc="Lightweight GTK4 autostart manager for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/kulmin/onset"
license=('MIT')
depends=('gtk4' 'libadwaita')
makedepends=('rust' 'cargo')
provides=('onset')
conflicts=('onset-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "data/com.github.kulmin.onset.desktop" "$pkgdir/usr/share/applications/com.github.kulmin.onset.desktop"
    install -Dm644 "data/icons/hicolor/scalable/apps/com.github.kulmin.onset.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.github.kulmin.onset.svg"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
