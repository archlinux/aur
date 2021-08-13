# Maintainer: Devin Singh <drsingh2518 [at] icloud [dot] com>
pkgname=midle-wl
_pkgname=midle
pkgver=0.1.0
pkgrel=1
pkgdesc='The mediocre idle client'
arch=('x86_64' 'x86')
url='https://gitlab.com/snakedye/midle'
license=('MIT')
makedepends=('git' 'cargo')
depends=('gcc-libs')
source=("git+https://gitlab.com/snakedye/midle.git")
sha256sums=('SKIP')

prepare() {
    cd ${srcdir}/${_pkgname}
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd ${srcdir}/${_pkgname}
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd ${srcdir}/${_pkgname}
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd ${srcdir}/${_pkgname}
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${_pkgname}"
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
