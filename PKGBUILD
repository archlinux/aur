# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=meshtui
pkgver=0.13.0
pkgrel=1
pkgdesc='Console text-user-interface for Meshtastic'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://github.com/PeterGrace/meshtui'
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
b2sums=('07382f048d3a1a3d14c4827dbc34e087fc62dd34e7f598d22eee2ee2a54018e878379017fcdbc12d2101c4f65c32fe05f9a31feab6de6b1701f386a1345eba2e')

prepare() {
  cd "${pkgname}"
  cargo fetch --locked
}

build() {
  cd "${pkgname}"
  rm .cargo/config.toml # removes hardcoded rustflags
  cargo build --frozen --release --target-dir=target
}

package() {
  # binary
  install -Dm755 "${srcdir}/${pkgname}/target/release/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  # license
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
