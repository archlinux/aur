# Maintainer: Bhanupong Petchlert <bpetlert@gmail.com>
pkgname=pkgdu
pkgver=0.9.2
pkgrel=1
pkgdesc="A tool to display packages disk usage size"
arch=('x86_64')
url="https://github.com/bpetlert/pkgdu"
license=('GPL-3.0-or-later')
depends=(libalpm.so)
makedepends=(cargo)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bpetlert/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('df1734177bc82113416af36f04590e0b6a168bb63353b3e208028e713741a035d6d11969710120892f3d5df18da5e2590af8ac4384a08c4f1c08a68ed2fb3724')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "target/release/pkgdu" "$pkgdir/usr/bin/pkgdu"
    install -Dm644 "README.adoc" "$pkgdir/usr/share/doc/${pkgname}/README.adoc"
}
