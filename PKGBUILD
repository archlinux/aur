# Maintainer: Gabriele Cabrini <gabrielecabrini@proton.me>

pkgname=scalable-cli-bin
pkgver=1.2.0
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
sha256sums_x86_64=('5a7b77c2bd5e66530ddc3fdab044b575adecf2ff13ec83898a82800a11e12f98')
sha256sums_aarch64=('c4aaabf12632455f5249202f15a80e27efd6bae29c24a02dd703ea072a9537a8')

package() {
  cd "sc-v${pkgver}-linux-${CARCH}-gnu"

  install -Dm755 sc "${pkgdir}/usr/bin/sc"

  local licdir="${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${licdir}"
  install -m644 -t "${licdir}" THIRD_PARTY_NOTICES.md DEPENDENCY_LICENSES.csv
  cp -r third_party_licenses "${licdir}/"
}
