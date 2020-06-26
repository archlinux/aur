# Maintainer: Alejandro Valdes <alejandrovaldes at live dot com>

pkgname=ncspot
pkgver=0.1.4
pkgrel=1
pkgdesc="Cross-platform ncurses Spotify client written in Rust, inspired by ncmpc and the likes."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/hrkfdn/ncspot"
license=('BSD')
depends=('ncurses' 'openssl' 'libpulse')
makedepends=('rust' 'cargo' 'git' 'alsa-lib' 'python')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/hrkfdn/ncspot/archive/${pkgver}.zip")
sha512sums=('5f2ce1e6fde382ca466e5ba1059cd62ce8c72aed048abb4a0ba1f9ba3aadf234396e38f17d21768073dcece673b616e1ae2f1fdb5695d528b6fa7f2884ae3f16')

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

