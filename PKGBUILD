# Maintainer : Daniel Bermond <dbermond@archlinux.org>

pkgname=cargo-c
pkgver=0.3.1
pkgrel=2
pkgdesc='A cargo subcommand to build and install C-ABI compatibile dynamic and static libraries'
arch=('x86_64')
url='https://github.com/lu-zero/cargo-c/'
license=('MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/lu-zero/cargo-c/archive/v${pkgver}.tar.gz")
sha256sums=('a8e662539218728372f6b8fbbbd72ff2092ecb71fb4ffef7e6a3969a0734e58f')

prepare() {
    cd "${pkgname}-${pkgver}"
    cargo fetch
}

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --bins --frozen
}

check() {
    cd "${pkgname}-${pkgver}"
    cargo test --release --frozen
}

package() {
    install -D -m755 "${pkgname}-${pkgver}/target/release/cargo-cbuild"   -t "${pkgdir}/usr/bin"
    install -D -m755 "${pkgname}-${pkgver}/target/release/cargo-cinstall" -t "${pkgdir}/usr/bin"
    install -D -m644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
