# Maintainer: Lucy Randall <lucybrown@vivaldi.net>
pkgname=are
pkgver=1.2.0
pkgrel=1
pkgdesc="Another Rust Editor - A port of the aee terminal-based text editor to Rust"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/anoraktrend/are"
license=('Artistic-2.0')
depends=()
makedepends=('cargo')
provides=('are')
conflicts=('are')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/anoraktrend/are/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('43464067def348f5a56d9e2afe90aee4e5f2dbd0825b5ab3f5fbd612e6644377')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "${pkgname}-${pkgver}"
    # Install the binary
    install -Dm755 "target/release/are" "$pkgdir/usr/bin/are"

    # Install license
    install -Dm644 "LICENSE.MD" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.MD"

    # Install documentation
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "Changes" "$pkgdir/usr/share/doc/$pkgname/Changes"
}
