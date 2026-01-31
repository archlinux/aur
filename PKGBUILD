# Maintainer: Ninso112 <Ninso112@pm.me>
pkgname=novafetch
pkgver=0.8
pkgrel=1
pkgdesc="A blazing fast, customizable CLI system information tool written in Rust"
arch=('x86_64')
url="https://github.com/Ninso112/NovaFetch"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f682b98566b45c6f1a65a498a427f93d9673cf9bbac6847e0ea2b1bc6ebf4476')

prepare() {
    cd "NovaFetch-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "NovaFetch-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "NovaFetch-$pkgver"
    # Installiere das Binary
    install -Dm755 "target/release/novafetch" "$pkgdir/usr/bin/novafetch"

    # Optional: Installiere Lizenz und Readme
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    # Optional: Config Beispiel (falls vorhanden)
    # install -Dm644 config.toml "$pkgdir/usr/share/doc/$pkgname/config.example.toml"
}

