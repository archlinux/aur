# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
_pkgname='Transgender.rs'
pkgname='transgender'
pkgver=1.5.7
pkgrel=1
pkgdesc='Minimalistic terminal file explorer'
arch=('x86_64')
url="https://github.com/Sberm/$_pkgname"
license=('BSD-2-Clause')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('10b46347a64d2167dd1b1030a1b9fcd65dcec8f3a10d0aaf42d59265ec3231e5')
makedepends=('rustup')
depends=('glibc' 'gcc-libs')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$_pkgname-$pkgver"
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$_pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

package() {
    cd "$_pkgname-$pkgver"
    install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
