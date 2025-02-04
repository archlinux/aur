# Maintainer: Federico Gomez <gomez00federico@gmail.com>
pkgname=nester
pkgver=0.1.0
pkgrel=1
pkgdesc="A CLI tool to generate MVC structures for Kotlin/Ktor projects."
arch=('x86_64')
url="https://github.com/fedeegmz/nester"
license=('GPL3')
depends=()
makedepends=(cargo)
source=("https://github.com/fedeegmz/nester/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
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
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"

    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
