# Maintainer: Yeremi Rios <contact@yarso.dev>
pkgname=lates
pkgver=0.1.0
pkgrel=1
pkgdesc="A minimal code template manager. Register and use code templates with ease."
url="https://github.com/yarso-su/lates"
license=("MIT")
arch=("x86_64")
depends=()
makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha256sums=("1ea76564f7c4e6aba1d56a3e2436c8c8ece925be54ea60c478c44ccb4fb5ca20")

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --locked
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/lates" "$pkgdir/usr/bin/lates"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
