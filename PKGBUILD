# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=lesspass-client
pkgver=0.10.2
pkgrel=1
pkgdesc='LessPass API server client library and CLI written in Rust'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://gitlab.com/ogarcia/lesspass-client'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
options=('!lto')
source=("https://gitlab.com/ogarcia/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
b2sums=('5c93b372b3a34c7850569cd99dc169736ae87cd369a4cfa410e3273b0f32289c7cae06d337d5949ea263d465577f639f0e0516d9b81fd3cbc5ede8811f0be0b2')

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
