# Maintainer: Visne <visne2 at proton dot me>

pkgname=roflcat
pkgver=0.1.0
pkgrel=1
pkgdesc="A faster lolcat, rainbows for your terminal."
arch=('any')
url="https://github.com/jameslzhu/roflcat/"
license=('BSD' 'custom')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cargo')
source=("$pkgname::git+https://github.com/jameslzhu/roflcat#commit=941d21c9be5574942812b4b620c4b5a9ea57437b")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "$pkgname"
    cargo build --frozen --release --all-features
}

package() {
    cd $pkgname
    install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
