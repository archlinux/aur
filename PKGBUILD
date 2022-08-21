# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=ncspot-cover
_pkgname=ncspot
pkgver=0.11.0
pkgrel=1
pkgdesc='Cross-platform ncurses Spotify client written in Rust, inspired by ncmpc and the likes. Built with the `cover` feature.'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/hrkfdn/ncspot'
license=('BSD')
depends=('dbus' 'hicolor-icon-theme' 'libpulse' 'libxcb' 'ncurses' 'openssl' 'ueberzug')
makedepends=('cargo' 'pkgconf' 'python')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin" "${_pkgname}-git" )
source=("${_pkgname}-v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('7ecad04d34332b5ef5c59bce50146420f601810b6e676b6df70b8f2e786ecbd329ffb7b1c6cbe58dca6e1e7eddcf2dd7e8fdc147b45cdec046cb568a4531bb60')

prepare() {
    cd "${_pkgname}-${pkgver}"
    cargo fetch --locked
}

build() {
    cd "${_pkgname}-${pkgver}"
    cargo build --release --locked --features cover
}

check() {
    cd "${_pkgname}-${pkgver}"
    cargo test --release --locked --features cover
}

package() {
    cd "${_pkgname}-${pkgver}"
    install -Dm 755 -t "${pkgdir}/usr/bin" "target/release/${_pkgname}"
    install -Dm 644 -t "${pkgdir}/usr/share/applications" "misc/${_pkgname}.desktop"
    install -Dm 644 "images/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
    install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
