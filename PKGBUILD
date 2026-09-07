# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=meshurl
pkgver=0.6.0
pkgrel=1
pkgdesc='A Meshtastic channel configuration URL encoder and decoder written in Rust'
arch=('armv7h' 'aarch64' 'i686' 'x86_64')
url='https://github.com/ogarcia/meshurl'
license=('GPL-3.0-or-later')
depends=('libgcc')
makedepends=('git' 'rust')
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
b2sums=('b987f4c3b7a922740b145b5012c9917d13b500e41c57467d330306086d3e646f5b9dc6d322940751be7fac34fbf1151387a0f23dc0458538e05dfd0565179b23')

prepare() {
  cd "${pkgname}"
  cargo fetch --locked
}

build() {
  cd "${pkgname}"
  cargo build --frozen --release --target-dir=target
}

package() {
  # binary
  install -Dm755 "${srcdir}/${pkgname}/target/release/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  # readme
  install -Dm644 "${srcdir}/${pkgname}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
