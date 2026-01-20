# Maintainer: Hydepwns <hydepwns@proton.me>
pkgname=phos
pkgver=0.4.10
pkgrel=1
pkgdesc='Universal log colorizer with 99+ program support'
arch=('x86_64' 'aarch64')
url='https://github.com/Hydepwns/phos'
license=('MIT' 'Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Hydepwns/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('061d9815c3f2dca8131151fd0d057cb4c676aa6aa3831ee5a791a3cb3d5e2696')

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

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/phos" "$pkgdir/usr/bin/phos"
    install -Dm755 "target/release/phoscat" "$pkgdir/usr/bin/phoscat"
    install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
