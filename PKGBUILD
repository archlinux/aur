# Maintainer: amadejk <amadejkastelic7@gmail.com>
pkgname=hyprlux
pkgver=0.1.3
pkgrel=1
pkgdesc="Hyprland utility that automates vibrance and night light control"
arch=('x86_64')
url="https://github.com/amadejkastelic/Hyprlux"
license=('MIT')
depends=('rust' 'cargo' 'hyprland')
makedepends=('git')
install="install.sh"
options=('!debug')
source=(
    "Hyprlux-${pkgver}.tar.gz::https://github.com/amadejkastelic/Hyprlux/archive/refs/tags/${pkgver}.tar.gz"
    "hyprlux.service"
    "config.toml"
)
sha256sums=(
    'a89df780b6262ce4343bd0a1ae6c539feef23e90d8be9379a6c4c67372b816f2'
    '201c8a74f08038ac95971bc601976fbf6b26f50ee2ec7859ee7f13df9113b135'
    '6c6308c8315abc06fda605e14c7be898304c2448ccc1c23c1845bf5a66a49647'
)

build() {
    cd "$srcdir/Hyprlux-${pkgver}"
    RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target cargo build --frozen --release
}

check() {
    cd "$srcdir/Hyprlux-${pkgver}"
    RUSTUP_TOOLCHAIN=stable cargo test --frozen
}

package() {
    cd "$srcdir/Hyprlux-${pkgver}"
    install -Dm755 "target/release/hyprlux" "$pkgdir/usr/bin/hyprlux"
    install -Dm644 "$srcdir/hyprlux.service" "$pkgdir/usr/lib/systemd/system/hyprlux.service"
    install -Dm644 "$srcdir/config.toml" "$pkgdir/usr/share/hyprlux/config.toml"
}

