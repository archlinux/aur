# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=meshurl
pkgver=0.4.1
pkgrel=1
pkgdesc='A Meshtastic channel configuration URL encoder and decoder written in Rust'
arch=('armv7h' 'aarch64' 'i686' 'x86_64')
url='https://github.com/ogarcia/meshurl'
license=('GPL-3.0-or-later')
depends=('libgcc')
makedepends=('git' 'rust')
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
b2sums=('493d0aafe16006060c529c3241df41e5295c582f1f2202700f9ed42ab1f456d40b4ffb51e588d649ad4fa4c85ebb28e4d73ee9b1d2d93b4c8104fbde1836aa7e')

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
