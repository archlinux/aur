# Maintainer: jojii <jojii@gmx.net>
pkgname=rsv
pkgver=1.1.0
pkgrel=1
pkgdesc="The runit sv command rewritten in rust with additional features"
license=("GPL-3.0")
arch=("x86_64")
makedepends=("cargo")
provides=("rsv")

pkgver() {
    (git describe --long --tags || echo "$pkgver") | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    export CARGO_TARGET_DIR="${srcdir}/${pkgname}-${pkgver}"
    cargo build --release
}

package() {
    export CARGO_TARGET_DIR="${srcdir}/${pkgname}-${pkgver}"
    cd ..
    usrdir="$pkgdir/usr"
    mkdir -p $usrdir
    cargo install --path . --root "$usrdir"
    rm -f $usrdir/.crates.toml
}

