# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=cicada-shell
_pkgname=cicada
pkgver=0.9.26
pkgrel=1
pkgdesc="A bash-like Unix shell written in Rust"
arch=('i686' 'x86_64')
url="https://github.com/mitnk/cicada"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
provides=('cicada')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('11debed7a6d0207a48152da5524d356752fb523335c82bde689634718cf7d30d')

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
