# Maintainer: Gabriele Cabrini <gabrielecabrini@proton.me>

pkgname=scalable-cli-bin
pkgver=1.1.0
pkgrel=3
pkgdesc="Command-line interface for Scalable Capital"
arch=('x86_64' 'aarch64')
url="https://github.com/ScalableCapital/scalable-cli"
license=('Apache-2.0')
# ca-certificates is not linked, but rustls reads /etc/ssl/certs/ca-certificates.crt at runtime
depends=('glibc' 'gcc-libs' 'ca-certificates')
optdepends=('org.freedesktop.secrets: store the session in the keyring instead of plain files')
provides=("scalable-cli=${pkgver}")
# 'sc' (AUR, ncurses spreadsheet) also ships /usr/bin/sc
conflicts=('scalable-cli' 'sc')
options=(!strip)
source_x86_64=("${url}/releases/download/v${pkgver}/sc-v${pkgver}-linux-x86_64-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/sc-v${pkgver}-linux-aarch64-gnu.tar.gz")
sha256sums_x86_64=('64aa3b566f52dab82abdb44c9f6c0a82628fbb392aff1450c84894908639acb8')
sha256sums_aarch64=('9e04c6f608bb1ac0ce4fa063f1971dece7a37842cbf1a6a231f497721298a4f8')

package() {
  cd "sc-v${pkgver}-linux-${CARCH}-gnu"

  install -Dm755 sc "${pkgdir}/usr/bin/sc"

  local licdir="${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${licdir}"
  install -m644 -t "${licdir}" THIRD_PARTY_NOTICES.md DEPENDENCY_LICENSES.csv
  cp -r third_party_licenses "${licdir}/"
}
