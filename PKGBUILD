# Maintainer: Gabriele Cabrini <gabrielecabrini@proton.me>

pkgname=scalable-cli-bin
pkgver=1.0.0
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
sha256sums_x86_64=('f572bf49b853be35c56bc59b7ab2f4576be2ed524a1a3a0b0658ed69a54a6180')
sha256sums_aarch64=('414761301b7f8c68df919484769d7086aa1477afbf2fd62e009ca792a796a0b8')

package() {
  cd "sc-v${pkgver}-linux-${CARCH}-gnu"

  install -Dm755 sc "${pkgdir}/usr/bin/sc"

  local licdir="${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${licdir}"
  install -m644 -t "${licdir}" THIRD_PARTY_NOTICES.md DEPENDENCY_LICENSES.csv
  cp -r third_party_licenses "${licdir}/"
}
