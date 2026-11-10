# Maintainer: Gabriele Cabrini <gabrielecabrini@proton.me>

pkgname=scalable-cli-bin
pkgver=1.3.0
pkgrel=1
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
sha256sums_x86_64=('309b0f0211c02d28391bd5db5f7745c98d5a2f47830b698cc5efb8095e0f7678')
sha256sums_aarch64=('ead8313fc7defe6fdebd11a32d315071f28432f2127d33459b032cae03cfe2e7')

package() {
  cd "sc-v${pkgver}-linux-${CARCH}-gnu"

  install -Dm755 sc "${pkgdir}/usr/bin/sc"

  local licdir="${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${licdir}"
  install -m644 -t "${licdir}" THIRD_PARTY_NOTICES.md DEPENDENCY_LICENSES.csv
  cp -r third_party_licenses "${licdir}/"
}
