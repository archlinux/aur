# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=rsop-open
_gitname=rsop
pkgver=1.4.2
pkgrel=1
pkgdesc='Simple, fast & configurable tool to open and preview files'
arch=('x86_64')
url="https://github.com/desbma/${_gitname}"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("${_gitname}-${pkgver}.tar.gz::https://github.com/desbma/${_gitname}/archive/${pkgver}.tar.gz")
sha512sums=('042d48a33b1615a40f53dd934ea6f9978216f75990bb9d106a37507b8eb30f18205ea20f8b797b0bcf79691a406a7afa83e9d079fbc9c610b6bd415a12b6f8e6')

prepare() {
    cd "${_gitname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "${_gitname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --frozen --release
}

check() {
    cd "${_gitname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "${_gitname}-${pkgver}"
    install -Dm 755 "./target/release/${_gitname}" "${pkgdir}/usr/bin/${pkgname}"
    ln -rs "${pkgdir}"/usr/bin/rs{op-open,p}
    ln -rs "${pkgdir}"/usr/bin/rs{op-open,o}
    ln -rs "${pkgdir}"/usr/bin/rs{op-open,e}
    ln -rs "${pkgdir}"/usr/bin/rs{op-open,i}
    install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
