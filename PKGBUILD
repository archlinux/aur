# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
_pkgname=arrive
pkgname=arv
pkgver=0.3.1
pkgrel=1
pkgdesc="arrive - A simple CLI tool for interacting with Advent of Code"
arch=('x86_64')
url="https://github.com/tranzystorekk/$_pkgname"
license=('MIT')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f8145f52e8c7f2d86cac98211b5c7dbff9798719e6f1f5064bcdd26918841b1f')
makedepends=('cargo')
depends=('gcc-libs' 'openssl')
options=('!lto')

prepare() {
    cd "$_pkgname-$pkgver"
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_pkgname-$pkgver"
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$_pkgname-$pkgver"
    install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
