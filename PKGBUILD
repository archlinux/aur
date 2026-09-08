# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=meshurl
pkgver=0.6.1
pkgrel=1
pkgdesc='A Meshtastic channel configuration URL encoder and decoder written in Rust'
arch=('armv7h' 'aarch64' 'i686' 'x86_64')
url='https://github.com/ogarcia/meshurl'
license=('GPL-3.0-or-later')
depends=('libgcc')
makedepends=('git' 'rust')
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
b2sums=('868ffd6ac19ddcab9c5d6a4579e878230de4e832d2d3586aa422a4b6fe360c2e798d34c3b6bf545e3868b3e6dd00a7baa82ad01eb41ee33f2c24aee8ead8e38c')

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
