# Maintainer: Matthias Schlich
pkgname=snglrtty
pkgver=0.1.0
pkgrel=1
pkgdesc="Terminal audio visualizer — singularity in your TTY"
arch=('x86_64')
url="https://github.com/the-unknown/snglrtty"
license=('MIT')
depends=('libpulse')
makedepends=('cargo' 'pkg-config')
source=("$pkgname-$pkgver.tar.gz::https://github.com/the-unknown/snglrtty/archive/v$pkgver.tar.gz")
sha256sums=('d8b87aba60a24feec4775a02c984beaa137330de6fc4aa1ec658786d732becf6 ')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/snglrtty" "$pkgdir/usr/bin/snglrtty"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
