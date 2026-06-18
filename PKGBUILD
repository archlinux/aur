# Maintainer: tony [tonycth@proton.me](mailto:tonycth@proton.me)
pkgname=arcfetch
pkgver=1.0.0
pkgrel=1
pkgdesc="A minimal and fast Rust-based system information fetch utility."
arch=('x86_64' 'aarch64')
url="https://github.com/tonycth7/arcfetch"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')

provides=("$pkgname")
conflicts=("$pkgname")

source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release
}

check() {
    cd "$pkgname"
    cargo test || true
}

package() {
cd "$pkgname"

install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true

install -Dm644 README.md \
    "$pkgdir/usr/share/doc/$pkgname/README.md"

}

