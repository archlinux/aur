# Maintainer: Aphosis <aphosis.github@gmail.com>
pkgname=gmux
pkgver=0.1.2
pkgrel=1
pkgdesc="Manage multiple git repositories with ease."
url="https://github.com/Aphosis/gmux"
license=("MIT")
arch=("x86_64")
makedepends=("cargo")
provides=("gmux")

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

