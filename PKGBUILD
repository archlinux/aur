# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
pkgname=rawbit
pkgver=0.1.4
pkgrel=1
pkgdesc='A camera RAW photo preprocessor and importer'
arch=('x86_64')
url="https://github.com/cartercanedy/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9f27ab2fc7baf90720a8ae83109c52776b016bacc626340ccc17b0ac642f3586')
makedepends=('rustup' 'glibc' 'gcc-libs')
depends=('libraw')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
