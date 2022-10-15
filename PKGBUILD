# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=ncspot-cover
_pkgname=ncspot
pkgver=0.11.2
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
sha512sums=('e673a27067b09133975a7b8ae97fea25075ab4a5ff759fa5199100c08c5883625b5bea2a7b90983e68f9fca0b92b44964a795724c5f9327839e3d758754b949f')

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
