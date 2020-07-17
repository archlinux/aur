# Maintainer: Alejandro Valdes <alejandrovaldes at live dot com>

pkgname=ncspot
pkgver=0.2.0
pkgrel=1
pkgdesc="Cross-platform ncurses Spotify client written in Rust, inspired by ncmpc and the likes."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/hrkfdn/ncspot"
license=('BSD')
depends=('ncurses' 'openssl' 'libpulse')
makedepends=('rust' 'cargo' 'git' 'alsa-lib' 'python')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/hrkfdn/ncspot/archive/v${pkgver}.zip")
sha512sums=('706e9eb884d80243a3579b54c29363ff68de9a749cd0e172f88a7392edf87e5e3a30463b655164e127923bad9731417eb3d6853cffca696dc34e44a3fcfdb75b')

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

