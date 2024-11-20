# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
pkgname=permitter
pkgver=3.0.0
pkgrel=2
pkgdesc='write licenses to stdout. a fork of licensor.'
arch=('x86_64')
url='https://github.com/adamperkowski/permitter'
license=('MIT')
makedepends=('rustup' 'git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1d3379b004a34ac0aaca431c31f630865ab49d397dbdc77cc6f1d31fd7fbfe2a')

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
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
