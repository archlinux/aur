# Maintainer: Max Niederman <max@maxniederman.com>
pkgname=ttyper
pkgver=0.1.13
pkgrel=1
pkgdesc="Terminal-based typing test."
url="https://github.com/max-niederman/ttyper"
license=("MIT")
arch=("any")
makedepends=("cargo")
provides=("ttyper")

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

