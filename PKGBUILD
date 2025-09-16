# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=rsop-open
_gitname=rsop
pkgver=1.5.0
pkgrel=1
pkgdesc='Simple, fast & configurable tool to open and preview files'
arch=('x86_64')
url="https://github.com/desbma/${_gitname}"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("${_gitname}-${pkgver}.tar.gz::https://github.com/desbma/${_gitname}/archive/${pkgver}.tar.gz")
sha512sums=('aa16a8410ecc77b7d204a7db91171724fdf8fb642e64f9a2b5e633d75e841434327fd6cd16e2ac36ef5ba656fc1abe864f06a9a1ffeb0eef3ab149da563549a7')

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
