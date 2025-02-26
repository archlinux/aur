# Maintainer: Ralph Torres <mail at ralphptorr dot es>
# Contributor: Salamandar <felix@piedallu.me>

pkgname=pylyzer
pkgver=0.0.82
pkgrel=1
pkgdesc='A fast, feature-rich static code analyzer & language server for Python'
arch=(any)
url=https://github.com/mtshiba/pylyzer
license=(MIT)

makedepends=(cargo)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=(c2b30b29764321ba2f2be50cbeded24add03bc17a663a92825b1bce8a60ba24c)

prepare() {
    cd "$srcdir"/$pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir"/$pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$srcdir"/$pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --workspace
}

package () {
    cd "$srcdir"/$pkgname-$pkgver
    install -Dm755 -t "$pkgdir"/usr/bin target/release/$pkgname
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname README.md
}
