# Maintainer: obselate <obselate@users.noreply.github.com>
pkgname=bntui
pkgver=0.1.1
pkgrel=1
pkgdesc='Terminal block explorer for Blocknet privacy blockchain'
arch=('x86_64' 'aarch64')
url='https://github.com/obselate/bntui'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/obselate/bntui/archive/v$pkgver.tar.gz")
sha256sums=('42160d9c70c0f1527470ede58cd1d1e6955ad83eb47fd980e1b9f0cffd4bb354')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
