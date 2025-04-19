# Maintainer: Maxr1998 <aur@maxr1998.de>
pkgname=alistral
_reponame=Alistral
pkgver=0.5.6
pkgrel=1
pkgdesc="Power tools for Listenbrainz"
arch=('x86_64')
url="https://github.com/RustyNova016/$_reponame"
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl' 'bzip2' 'xz')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RustyNova016/$_reponame/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('eedc13704cc001325d27f2c41af805afcf27ca1eae279a39ba0de813e7a7246425d4542d249f0bbb8b846f9154a705cdb431e89fdfe47728230da127d5fed28d')

prepare() {
    cd "$_reponame-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_reponame-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features --no-default-features
}

check() {
    cd "$_reponame-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$_reponame-$pkgver"

    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/lib/$pkgname/"

    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
