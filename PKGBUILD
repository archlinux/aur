# Maintainer: Alejandro Valdes <alejandrovaldes at live dot com>

pkgname=ncspot
pkgver=0.1.2
pkgrel=1
pkgdesc="Cross-platform ncurses Spotify client written in Rust, inspired by ncmpc and the likes."
arch=('x86_64')
url="https://github.com/hrkfdn/ncspot"
license=('BSD')
depends=('ncurses' 'openssl' 'libpulse')
makedepends=('rust' 'cargo' 'git' 'alsa-lib' 'python')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/hrkfdn/ncspot/archive/v${pkgver}.zip")
sha512sums=('1dd1e9e15cb1c400bf6bc0fdf9fa3f580f962d82912d62ec6315832053467ebd45a09c019e343ec721311972603679c2ebde5b9201e7222853513571b79e7f25')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo fetch --locked
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --locked
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo test --release --locked
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  #cargo install --root "${pkgdir}/usr" --path "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 755 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

