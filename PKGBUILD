# Maintainer: Hendrik Wolff <hendrik.wolff@agdsn.me>
# Contributor: Patrik Tesarik <depate@das-labor.com>
pkgname='swayws'
pkgver=1.1.1
pkgrel=1
pkgdesc="A sway workspace tool which allows easy moving of workspaces to and from outputs"
arch=('x86_64')
url="https://gitlab.com/w0lff/swayws"
license=('MIT')
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('255ede5f7f2b131d5dd09cbe5bb099bffa725cc2fb079714a90e4f047de7f44e835a20c17ab6ea06489cc07e21cb6b567db6eef64b8f62985170cee35074b884')

prepare() {
    cd $pkgname-$pkgver
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd $pkgname-$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
