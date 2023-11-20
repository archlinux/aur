# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=rsop
pkgver=1.4.0
pkgrel=1
pkgdesc='Simple, fast & configurable tool to open and preview files'
arch=('x86_64')
url="https://github.com/desbma/${pkgname}"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('48cfaad8c6c8109a05e5b0e12526760497fc00f27e4329bd14566836d1057637266ca776836ec28acf9565133722eccd002a7b43dbd343da9b3a0d47d834a4d6')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --frozen --release
}

check() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 -t "${pkgdir}/usr/bin" ./target/release/${pkgname}
    ln -rs "${pkgdir}"/usr/bin/rs{op,p}
    ln -rs "${pkgdir}"/usr/bin/rs{op,o}
    ln -rs "${pkgdir}"/usr/bin/rs{op,e}
    ln -rs "${pkgdir}"/usr/bin/rs{op,i}
    install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
