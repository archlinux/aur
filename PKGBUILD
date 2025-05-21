# Maintainer: Aethar <elliott.ashby88@gmail.com>

_pkgname=twitch-tui
pkgname="${_pkgname}-git"
pkgver=2.6.19.r0.c1c79f0
pkgrel=1
pkgdesc="Twitch chat in the terminal"
arch=('any')
url="https://github.com/Xithrius/twitch-tui"
license=('MIT')
makedepends=('git' 'cargo')
provides=(twt)
source=("git+${url}.git")

build() {
    cd "${srcdir}" || exit
    cd "${_pkgname}" || exit
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${srcdir}" || exit
    cd "${_pkgname}" || exit
    install -Dm755 target/release/twt "${pkgdir}/usr/bin/twt"
    install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
sha256sums=('SKIP')
