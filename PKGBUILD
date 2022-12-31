# Maintainer: Jasper <j@sperp.dev> -> https://github.com/jaspwr

pkgname=lia-git
pkgver=0.2.2
pkgrel=1
pkgdesc="Compiler for LiA, a transpiled superset of TeX for writing LaTeX."
makedepends=('rust' 'cargo')
license=('GPL')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/jaspwr/LiA"

source=("$pkgname::git+https://github.com/jaspwr/LiA#branch=main")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release
}

package() {
    cd "$pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/lia"
}
