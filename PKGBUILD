# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=ncspot-cover
_pkgname=ncspot
pkgver=0.10.0
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
sha512sums=('7eb190264f119a5d6ce1809b3b93910c827476c138867892ae06aee90f2c846cd172a1faea39307b87d20c2632eac1bc93682a7588980d2fdf4a82a8edded78f')

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
