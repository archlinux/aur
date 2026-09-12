# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=meshurl
pkgver=0.6.2
pkgrel=1
pkgdesc='A Meshtastic channel configuration URL encoder and decoder written in Rust'
arch=('armv7h' 'aarch64' 'i686' 'x86_64')
url='https://github.com/ogarcia/meshurl'
license=('GPL-3.0-or-later')
depends=('libgcc')
makedepends=('git' 'rust')
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
b2sums=('f76a2e0d625676e75db50600f0a6f6e444fa08cfa10a6c4fe4460b6ce2d2a708efe3092a862f2fea5d16b60204cbb08e79c29e7c3ab4dcee238de0c3686e03af')

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
