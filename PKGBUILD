# maintainer: André Kugland <kugland@gmail.com>

pkgname=neocities-deploy
pkgver='0.1.3'
pkgrel=1
pkgdesc='A command-line tool for deploying your Neocities site. It can upload files to your site, list remote files, and more.'
arch=('any')
source=("https://github.com/kugland/neocities-deploy/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('31eb22a748ab22e09a57a88fa4f3e9f86b56260cbddca4ff5b84e20ebbdad3e2')
makedepends=(cargo)

prepare() {
    cd "$srcdir/neocities-deploy-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --frozen --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/neocities-deploy-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features --frozen
}

check() {
    cd "$srcdir/neocities-deploy-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --all-features --frozen
}

package() {
    cd "$srcdir/neocities-deploy-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
