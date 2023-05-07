# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=dipc
pkgver=1.0.0
pkgrel=3
pkgdesc="Convert your favorite images and wallpapers with your favorite color palettes/themes"
arch=('any')
url="https://github.com/doprz/dipc"
license=('MIT' 'APACHE')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('dd98bf2eea8e97dfaeb8d4e0a991a732e35bf71e1b9bdf0045fdad80e0c0d319')

prepare() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --release --frozen
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm 755 target/release/dipc -t "$pkgdir/usr/bin"

    install -Dm 644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm 644 LICENSE-APACHE -t "$pkgdir/usr/share/licenses/$pkgname"
}
