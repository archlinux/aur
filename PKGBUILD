# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=meshurl
pkgver=0.5.0
pkgrel=1
pkgdesc='A Meshtastic channel configuration URL encoder and decoder written in Rust'
arch=('armv7h' 'aarch64' 'i686' 'x86_64')
url='https://github.com/ogarcia/meshurl'
license=('GPL-3.0-or-later')
depends=('libgcc')
makedepends=('git' 'rust')
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
b2sums=('d1f3d871560b7b03f71d00985978218b92e542d5e4cc83cb6f8e7ab10141ca48822145b4ad5efc7b3cf0fdbe5847d97c8a6466cd85c2a73be7eebbe624b415a1')

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
