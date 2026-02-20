# Maintainer: Your Name <lucyrandall@helltop.net>
pkgname=are
pkgver=1.0.0
pkgrel=1
pkgdesc="Another Rust Editor - A port of the aee terminal-based text editor to Rust"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/anoraktrend/are"
license=('custom:Artistic-2.0')
depends=('rust')
makedepends=('cargo')
provides=('aee')
conflicts=('aee')
source=("https://github.com/anoraktrend/are/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5b01e20db53bf03837e67af55022ed4fdaa7b21bb7dbecc17b705ee64205605e')

build() {
    cd "$srcdir/are-${pkgver}"
    cargo build --release
}

package() {
    cd "$srcdir/are-${pkgver}"

    # Install the binary
    install -Dm755 "target/release/are" "$pkgdir/usr/bin/are"

    # Install license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install documentation
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
