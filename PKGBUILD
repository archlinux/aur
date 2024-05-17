# Maintainer: Jisu-Woniu <jswn@jswn9945.xyz>
pkgname=typstyle
pkgver=0.11.20
pkgrel=1
pkgdesc="Beautiful and reliable typst code formatter"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/Enter-tainer/typstyle"
license=('Apache-2.0')
makedepends=('cargo')
optdepends=("typst: For typst compilation")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('700e02f030019340ce2d8fd1cf5a011627b265231c5b730a98b75d8462bed2f2')

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
