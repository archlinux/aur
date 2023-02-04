# Maintainer: Duale Siad <me@wale.id.au>
pkgname=bandsnatch
pkgver=0.1.1
pkgrel=1
pkgdesc="A CLI batch downloader for your Bandcamp collection."
url="https://github.com/Ovyerus/bandsnatch"
license=('MIT')

arch=('x86_64' 'armv7h' 'aarch64')
makedepends=('rust' 'cargo' 'git' 'openssl')

provides=("${pkgname}")
conflicts=("${pkgname}")

source=("https://github.com/Ovyerus/bandsnatch/archive/v${pkgver}.zip")
sha256sums=('f0759ed718a924e8bd2a728e3a6003d9c07c67a4b676dee82822a5c90806dac9')

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
}
