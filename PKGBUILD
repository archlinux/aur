# Maintainer: Dylan <dylanh@aur.archlinux.org>
pkgname=rune-editor
pkgver=0.3.0
pkgrel=1
pkgdesc="A modern CLI text editor that bridges the gap between nano's simplicity and advanced features"
arch=('x86_64')
url="https://github.com/exec/rune"
license=('MIT')
depends=('oniguruma')
makedepends=('rust' 'cargo' 'pkgconf')
provides=('rune')
conflicts=('rune-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/exec/rune/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8054d9b4efb3da93bcd569cf0f60a5b317fc96d13b9fab85bea1f5beae3175f8')

build() {
    cd "rune-$pkgver"
    export PKG_CONFIG_PATH=/usr/lib/pkgconfig
    export ONIG_LIB_DIR=/usr/lib
    export ONIG_INCLUDE_DIR=/usr/include
    export RUSTFLAGS="-L /usr/lib -l onig"
    cargo build --release --locked
}

check() {
    cd "rune-$pkgver"
    cargo test --release --locked
}

package() {
    cd "rune-$pkgver"
    install -Dm755 target/release/rune "$pkgdir/usr/bin/rune"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}