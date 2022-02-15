# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=cicada-shell
_pkgname=cicada
pkgver=0.9.24
pkgrel=1
pkgdesc="A bash-like Unix shell written in Rust"
arch=('i686' 'x86_64')
url="https://github.com/mitnk/cicada"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
provides=('cicada')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2da92ed04b2f328ee37811d5a6716d9d0cf09d3fd5b03ff5232c2fa9e4d13b24')

prepare() {
    cd $_pkgname-$pkgver
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd $_pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd $_pkgname-$pkgver
    install -Dm755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    find docs/ -type f -exec install -Dm644 "{}" -t "$pkgdir/usr/share/doc/$pkgname" \;
}
