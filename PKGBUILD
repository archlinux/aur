# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=lesspass-client
pkgver=0.4.0
pkgrel=1
pkgdesc='LessPass client library and CLI written in Rust'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://github.com/ogarcia/lesspass-client'
license=('GPL3')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ogarcia/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('94284eb1061de3254a8fe3c9d17f90dd8f82c19a61b65211f6d5c135d38e90ae19e4ba1dc2e5af852a1ca388785583907c0411df5bb7d3a53d17d146e7af312f')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked
}

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --frozen --release --target-dir=target
}

package() {
  # binary
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  # readme
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
