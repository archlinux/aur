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
source=("$pkgname-$pkgver.tar.gz::https://github.com/yarso-su/lates/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("e540090918917d997417d97d77cb3d80accb1e9f40ce1844e05c0ba041353a69")

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
