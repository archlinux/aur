# Maintainer: Alejandro Valdes <alejandrovaldes at live dot com>

pkgname=ncspot
pkgver=0.1.3
pkgrel=1
pkgdesc="Cross-platform ncurses Spotify client written in Rust, inspired by ncmpc and the likes."
arch=('x86_64' 'aarch64')
url="https://github.com/hrkfdn/ncspot"
license=('BSD')
depends=('ncurses' 'openssl' 'libpulse')
makedepends=('rust' 'cargo' 'git' 'alsa-lib' 'python')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/hrkfdn/ncspot/archive/v${pkgver}.zip")
sha512sums=('72ee06a0c79f2a5e51e81e095bc82bd948be16d66ac497366fd7d2dee04494735eb5455850c64922e763c3bde84fb1cbc39a5022f643ed6114bce79f6ca931eb')

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

