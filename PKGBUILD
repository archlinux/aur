# Maintainer: denkijin < dandenkijin at gmail dot com >
pkgname=owm
pkgver=0.1.0
pkgrel=1
pkgdesc="An experimental River layout generator using mathematical optimization to invent layouts on-the-fly."
arch=('any')
url="https://github.com/justinlovinger/owm"
license=('MIT')
makedepends=('cargo')
source=("${pkgname}::git+https://github.com/justinlovinger/${pkgname}.git")
md5sums=('SKIP')
#pkgver() {
#    cd "${pkgname}"
#    git describe --tags --long | sed 's/\([^-]*-g\)/r\1/; s/-/./g; s/^v//g'
#}
prepare() {
    cd "${pkgname}" 
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}
build() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release
}


package() {
   cd "${pkgname}"

   install -Dm755 "${srcdir}/${pkgname}/target/release/owm" "${pkgdir}/usr/bin/owm"
}

