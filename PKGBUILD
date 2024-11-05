# Maintainer: aarto <aarto@archlinux.org>
pkgname=mtracker
pkgver=0.4.0
pkgrel=1
pkgdesc='cli movie tracker - keep track of watched movies and series'
url='https://github.com/r-unruh/mtracker'
license=('MIT')
arch=('x86_64')
makedepends=(cargo)
provides=('mtracker')
conflicts=('mtracker')
source=("https://github.com/r-unruh/mtracker/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('ae35aa5aa21024a76dfa1b186de307227b18ed3e12e00a1f605c39ff2953521d0f32e56a8bd422799e67e41ed5b84896f462fc66f4507267d2e96735a243c18a')

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
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
