# Maintainer: tkirishima <tkirishima[at]proton[dot]me>
pkgname=hbd
pkgver=0.1.0
pkgrel=3
pkgdesc="A command-line tool to remember birthdays easily!"
arch=('any')
url="https://github.com/tkr-sh/hbd"
license=('GPL-3.0-or-later')
makedepends=(cargo)

source=(
    "${pkgname}::git+$url.git"
)


prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "${srcdir}/${pkgname}"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "${srcdir}/${pkgname}"
    cargo build --frozen --release
}


check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "${srcdir}/${pkgname}"
    cargo test
    target/release/hbd get
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
sha256sums=('SKIP')
