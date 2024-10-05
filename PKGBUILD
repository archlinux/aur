# Maintainer: Kemel Zaidan <kemelzaidan@gmail.com>
pkgname=tuime
pkgver=1.0.1
pkgrel=2
makedepends=('rust' 'cargo')
depends=('glibc' 'gcc-libs')
optdepends=('cfonts: sexy and colorful fonts for the console')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A colorful and fun TUI clock written in Rust, with a screensaver mode"
license=('GPL-3.0-only')
url="https://github.com/nthnd/tuime"
source=("$url/archive/refs/tags/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('98e359afd1138405ad49da1807691d87e2a5051e37c22b01cd8c928aab7bd6bc')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"    
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

check(){
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
