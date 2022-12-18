# Maintainer: Rouven Himmelstein <rouvenhimmelstein@gmail.com>

_pkgname=chwp
pkgname=${_pkgname}-git
pkgver=1.163.0
pkgrel=1
pkgdesc="Changes the background wallpaper and lockscreen from the command line."
arch=('x86_64')
url="https://github.com/RouHim/chwp"
license=('GPL-3.0-or-later')
makedepends=('cargo')
provides=('chwp')
conflicts=('chwp')
source=("$_pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$_pkgname/$_pkgname-$pkgver.crate")
sha1sums=('SKIP')

prepare() {
    cd "$srcdir/$_pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$_pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}