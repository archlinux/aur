# Maintainer: paypur <pieceofpaypur at gmail dot com>

pkgname=xpflasher
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="A command-line tool for flashing Sony Xperia devices using firmware files downloaded with XperiFirm"
arch=("x86_64")
url="https://github.com/paypur/xpflasher"
license=("MIT")
depends=("glibc" "libgcc")
makedepends=("cargo" "git")
source=("git+https://github.com/paypur/xpflasher.git#tag=v$pkgver")
sha256sums=("5a5c94682f10738402a0262a27c6e3b62682ace82ea786285184849feb911e0b") # generate with "makepkg -g"

prepare() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
