# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=ncspot-cover
_pkgname=ncspot
pkgver=0.10.1
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
sha512sums=('7b25402618e454bcb9b655898c86ef9682378169c4464355c7cde0ad1cbc6fb39b23b6d31211a82d38255d5c75a8000085ccc75dff321928264beb416950d094')

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
