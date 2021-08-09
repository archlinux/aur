# Maintainer: Gingka Akiyama <gingkathfox at gmail dot com>
pkgname=spwn-lang
_binname="spwn"
pkgver=0.0.5
pkgrel=1
pkgdesc="A language for Geometry Dash triggers. An easy way to create levels using code."
arch=('x86_64')
url="https://github.com/Spu7Nix/SPWN-language"
license=('MIT')
groups=()
depends=(rust)
makedepends=(git cargo)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/Spu7Nix/SPWN-language.git)
noextract=()
sha256sums=('SKIP')

prepare() {
    cd $srcdir/SPWN-language/spwn-lang
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd $srcdir/SPWN-language/spwn-lang
    cargo build --frozen --release --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/SPWN-language/spwn-lang/target/release/$_binname"
}
