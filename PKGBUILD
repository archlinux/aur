# Maintainer: Jisu-Woniu <jswn@jswn9945.xyz>
pkgname=typstyle
pkgver=0.11.22
pkgrel=1
pkgdesc="Beautiful and reliable typst code formatter"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/Enter-tainer/typstyle"
license=('Apache-2.0')
makedepends=('cargo')
optdepends=("typst: For typst compilation")
source=("$pkgname.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d3f2e9a5a539992ad1093dab932e018150fb8b88a96b7a7ad1e56ed69a6fd55d')

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

package() {
    install -Dm755 "$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
