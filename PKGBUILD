# Maintainer: Alejandro Valdes <alejandrovaldes at live dot com>

pkgname=ncspot
pkgver=0.4.0
pkgrel=2
pkgdesc="Cross-platform ncurses Spotify client written in Rust, inspired by ncmpc and the likes."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/hrkfdn/ncspot"
license=('BSD')
depends=('ncurses' 'openssl' 'libpulse' 'libxcb' 'ncurses' 'dbus')
makedepends=('rust' 'cargo' 'git' 'alsa-lib' 'python' 'pkgconf')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/hrkfdn/ncspot/archive/v${pkgver}.zip")
sha512sums=('be6a52270f49ce424ea2f99a26645665e8b9e2b616ed286fa2f060b5bf38dde98946d5b1b411505144b48e95cc7c5492c81474ee430571b41bbd0da565b5b315')

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

