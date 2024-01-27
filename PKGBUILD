pkgname=tag
pkgver=0.3.0
pkgrel=1
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
pkgdesc="Search for local text files with a simple tagging system."
arch=('x86_64')
url='https://github.com/miampf/tag'
license=('MIT')
provides=('tag')
makedepends=(cargo)
sha1sums=('SKIP')

prepare() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features --target "$(rustc -vV | sed -n 's/host: //p')"
}


check() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features --target "$(rustc -vV | sed -n 's/host: //p')"
}

package() {
    cd $pkgname-$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/$(rustc -vV | sed -n 's/host: //p')/release/$pkgname"
}
