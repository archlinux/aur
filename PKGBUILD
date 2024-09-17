# Maintainer: Jan Fidra <tkmxqrd@gmail.com>

pkgname=logviewer-systemd
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple log viewer and filter for journalctl"
arch=('x86_64')
url="https://github.com/tkmxqrdxddd/logviewer-systemd"
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tkmxqrdxddd/logviewer-systemd/archive/v$pkgver.tar.gz")
sha256sums=('6b1e3de047664f6f39ffcd381248558b739deb4bc1d9f2f44996b455859b2c62')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"
    # Find the binary name from Cargo.toml
    local binary_name=$(grep -oP '(?<=name = ")[^"]*' Cargo.toml)
    install -Dm755 "target/release/$binary_name" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
