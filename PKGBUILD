# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
pkgname=tukai
pkgver=0.1.2
pkgrel=1
pkgdesc='interactive typing experience with switchable templates, designed to help users improve their typing speed and accuracy'
arch=('x86_64')
url="https://github.com/hlsxx/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('89c44e135f1090837116d54983193fd218e947ba377c85752b4da86bbf99b12b')
makedepends=('rustup' 'glibc' 'gcc-libs')
depends=('libx11')

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
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
