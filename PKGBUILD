# Maintainer: Gabriele Cabrini <gabrielecabrini@proton.me>

pkgname=scalable-cli-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Command-line interface for Scalable Capital"
arch=('x86_64')
url="https://github.com/ScalableCapital/scalable-cli"
license=('Apache-2.0')
# ca-certificates is not linked, but rustls reads /etc/ssl/certs/ca-certificates.crt at runtime
depends=('glibc' 'gcc-libs' 'ca-certificates')
optdepends=('gnome-keyring: store the session in the keyring instead of plain files')
provides=("scalable-cli=${pkgver}")
# 'sc' (AUR, ncurses spreadsheet) also ships /usr/bin/sc
conflicts=('scalable-cli' 'sc')
options=(!strip)
source=("${url}/releases/download/v${pkgver}/sc-v${pkgver}-linux-x86_64-gnu.tar.gz")
sha256sums=('f572bf49b853be35c56bc59b7ab2f4576be2ed524a1a3a0b0658ed69a54a6180')

package() {
  cd "sc-v${pkgver}-linux-x86_64-gnu"

  install -Dm755 sc "${pkgdir}/usr/bin/sc"

  local licdir="${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${licdir}"
  install -m644 -t "${licdir}" THIRD_PARTY_NOTICES.md DEPENDENCY_LICENSES.csv
  cp -r third_party_licenses "${licdir}/"
}
