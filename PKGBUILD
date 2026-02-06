# Maintainer: novica <nnovica@gmail.com>

pkgname=rv
pkgver=0.17.1
pkgrel=1
pkgdesc="A declarative R package manager"
url="https://github.com/a2-ai/rv"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=(
    gcc-libs
    glibc
)
conflicts=('rv-bin')
optdepends=()
makedepends=('rust')
options=('!lto' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/a2-ai/rv/archive/v${pkgver}.tar.gz")

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo fetch --locked
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cargo build --release --locked --features=cli
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/rv"  "${pkgdir}/usr/bin/rv"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('8147c9361c9e1dc5d22a5209be3d6554d38d272fcb203eb568eca496ea26d52e0082cce43f0544e46f38b9fd78bdcbfad870356992e98d25c46ce396c880aea8')
