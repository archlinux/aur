# Maintainer:  echo -n 'TWljaGFsIFMuIDxtaWNoYWxAZ2V0Y3J5c3QuYWw+' | base64 -d
# Contributor: echo -n 'Um9iaW4gQy4gPHJjYW5kYXVAZ2V0Y3J5c3QuYWw+' | base64 -d
# Contributor: echo -n 'TWF0dCBDLiA8bWF0dEBnZXRjcnlzdC5hbD4='     | base64 -d

pkgname=ame
_pkgname=amethyst
pkgver=4.0.3
pkgrel=4
_codename='Funky Fish'
pkgdesc='Amethyst is a fast and efficient AUR helper'
arch=('x86_64' 'aarch64')
url="https://git.getcryst.al/crystal/software/${_pkgname}"
license=('GPL3')
depends=(
    'git'
    'pacman-contrib'
    'vim'
    'expac'
    'less'
)
makedepends=('cargo')
source=("${url}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('850b6eda89316e4da1148506377471c1cda878077143b6f1983b61b0dba8d8c0')

prepare() {
    cd "${_pkgname}-v${pkgver}"
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "${_pkgname}-v${pkgver}"
    export RUSTUP_TOOLCHAIN=nightly
    export CARGO_TARGET_DIR=target
    export AMETHYST_CODENAME="${_codename}"
    cargo build --frozen --release
}

package() {
    cd "${_pkgname}-v${pkgver}"
    install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
