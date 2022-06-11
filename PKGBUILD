# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=ncspot-cover
_pkgname=ncspot
pkgver=0.10.0
pkgrel=1
pkgdesc='Cross-platform ncurses Spotify client written in Rust, inspired by ncmpc and the likes. Built with the `cover` feature.'
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/hrkfdn/ncspot"
license=('BSD')
depends=('ncurses' 'openssl' 'libpulse' 'libxcb' 'ncurses' 'dbus' 'ueberzug')
makedepends=('rust' 'cargo' 'git' 'alsa-lib' 'python' 'pkgconf')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin" "${_pkgname}-git" )
source=("https://github.com/hrkfdn/ncspot/archive/v${pkgver}.zip")
sha512sums=('4d71e56f38385f529cb36fb4c589468a0cd5b4504bb400e0b92efdd7dfb36e6d05891ce6f254c0ca4ad8c7c02dce00be5dfac46cd690f8a9382f56f296bec6a2')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cargo fetch --locked
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cargo build --release --locked --features cover
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cargo test --release --locked --features cover
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  #cargo install --root "${pkgdir}/usr" --path "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm 644 "images/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/ncspot.svg"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
