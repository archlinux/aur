# Maintainer: Rodolphe Bréard <packages@what.tf>
pkgname=opensmtpd-filter-sake
pkgver=1.0.0
pkgrel=2
pkgdesc="OpenSMTPD filter for sub-address verification"
arch=('x86_64')
url="https://github.com/breard-r/opensmtpd-filter-sake/"
license=('Apache' 'MIT')
depends=('glibc' 'gcc-libs')
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/breard-r/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('93603d352045df8b242608c466929932084bd8e71ed39dca4ab1cbb7663a77dc')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "target/release/filter-sake" "${pkgdir}/usr/lib/smtpd/opensmtpd/filter-sake"
  install -Dm644 "LICENSE-APACHE-2.0.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE-2.0.txt"
  install -Dm644 "LICENSE-MIT.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT.txt"
}
