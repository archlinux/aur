# Maintainer: DROO <droo@axol.io>
pkgname=phos
pkgver=0.4.8
pkgrel=1
pkgdesc="High-performance universal log colorizer with 98 built-in programs"
arch=('x86_64' 'aarch64')
url="https://github.com/Hydepwns/phos"
license=('MIT' 'Apache-2.0')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Hydepwns/phos/archive/v$pkgver.tar.gz")
sha256sums=('7cb9ff69210ca79a320ba3f0febd3d068c5718ab8077c78775da7c159e47cc44')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/phos" "$pkgdir/usr/bin/phos"
    install -Dm755 "target/release/phoscat" "$pkgdir/usr/bin/phoscat"
    install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
