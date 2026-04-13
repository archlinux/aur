# Maintainer: Matthias Schlich
pkgname=solarust
pkgver=0.1.1
pkgrel=1
pkgdesc="A terminal animation of a randomly generated solar system, written in Rust"
arch=('x86_64')
url="https://github.com/the-unknown/solarust"
license=('Apache-2.0')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/the-unknown/solarust/archive/v$pkgver.tar.gz")
sha256sums=('413a583eab311b1448006735ebdc540f1c85118a860445be1c0313e47af4ba28')

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
    install -Dm755 "target/release/solarust" "$pkgdir/usr/bin/solarust"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
