# Maintainer: xomvio <xomvio at proton dot me>

pkgname=watermarker
pkgver=0.2.3
pkgrel=1
pkgdesc='CLI tool for adding watermark to images'
url="https://github.com/xomvio/$pkgname"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a45bf30ff2c399348ed2481e175111cb1936cd92c96d0a65e35cd8e7e2c7b7ad')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
