# Maintainer: zodium-project
pkgname=zfetch-rs
pkgver=2.6.0
pkgrel=1
pkgdesc="A fast & pretty system fetch tool written in rust"
arch=('x86_64' 'aarch64')
url="https://github.com/zodium-project/zfetch-rs"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
conflicts=('zfetch')
provides=('zfetch')
source=("zfetch-rs::git+https://github.com/zodium-project/zfetch-rs.git#branch=stable")
sha256sums=('SKIP')

prepare() {
    cd "zfetch-rs"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "zfetch-rs"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --locked --release
}

package() {
    cd "zfetch-rs"
    install -Dm755 "target/release/zfetch" "$pkgdir/usr/bin/zfetch"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md" 2>/dev/null || true
}
