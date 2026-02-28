# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=meshtui
pkgver=0.12.2
pkgrel=1
pkgdesc='Console text-user-interface for Meshtastic'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://github.com/PeterGrace/meshtui'
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'rust')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
b2sums=('cad7cf298271f4877fe18f2ec8628da0eee782e0403f5eeebca072cd0d99ae27b60b8ab7fb0ca0c89753f65c680daa90f6d4dca20c876133ac1c4d4b1078f98b')

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
  # license
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
