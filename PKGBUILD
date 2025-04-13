# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
pkgname=rawbit
pkgver=0.1.14
pkgrel=1
pkgdesc='A camera RAW photo preprocessor and importer'
arch=('x86_64')
url="https://github.com/cartercanedy/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5085386a044b9bd6a87e8ff784b5b74284e21ef478f7a29ac57b96a1dfa3b085')
makedepends=('rustup')
depends=('libiconv' 'gcc-libs')

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
