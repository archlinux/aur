# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=rsop-open
_gitname=rsop
pkgver=1.6.1
pkgrel=1
pkgdesc='Simple, fast & configurable tool to open and preview files'
arch=('x86_64')
url="https://github.com/desbma/${_gitname}"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("${_gitname}-${pkgver}.tar.gz::https://github.com/desbma/${_gitname}/archive/${pkgver}.tar.gz")
sha512sums=('9e1e5366977aca177736f37e7da643cfcf67942fb84774c732c3ecf44f6d923e76c60f5cffbb5049dc8993c5fa72363dd21f97468125667380857fc72967903b')

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
