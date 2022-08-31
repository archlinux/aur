# Contributor: Patrik Tesarik <depate@das-labor.com>
pkgname='swayws'
pkgver='0.2.3'
pkgrel='2'
pkgdesc="A sway workspace tool which allows easy moving of workspaces to and from outputs"
arch=('x86_64')
url="https://gitlab.com/w0lff/swayws"
license=('MIT')
makedepends=(cargo)
_commit=feb4c7fab41b83bf251ff7a31440f5e4028f30bd # version 0.2.3
source=("git+$url#commit=$_commit")
sha512sums=('SKIP')

prepare() {
    cd $pkgname
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
 }

build() {
    cd $pkgname
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
 }

 check() {
    cd $pkgname
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd $pkgname
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
