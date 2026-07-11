# Maintainer: robertfoster

pkgname=rice-proto
pkgver=0.4.3 # renovate: datasource=crate depName=rice-proto
pkgrel=1
pkgdesc="Sans-IO implementation of the ICE (RFC8445) protocol, with a C API"
arch=('x86_64')
url="https://github.com/ystreet/librice"
license=('MIT' 'Apache')
depends=('gcc-libs' 'openssl')
makedepends=('cargo-c' 'rust')
options=(!lto)
source=(
  "https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate"
  "LICENSE-MIT::https://raw.githubusercontent.com/ystreet/librice/v${pkgver}/LICENSE-MIT"
  "LICENSE-APACHE::https://raw.githubusercontent.com/ystreet/librice/v${pkgver}/LICENSE-APACHE"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

build() {
  cd "${pkgname}-${pkgver}"
  cargo cbuild --release --prefix=/usr --libdir=/usr/lib --features capi
}

package() {
  cd "${pkgname}-${pkgver}"
  cargo cinstall --release --prefix=/usr --libdir=/usr/lib --destdir="${pkgdir}" --features capi
  install -Dm644 "${srcdir}/LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
