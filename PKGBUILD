# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: yinflying (https://aur.archlinux.org/account/yinflying)

pkgname=bnc-bin
_debianver=12
pkgver=2.13.2
pkgrel=1
pkgdesc="The BKG Ntrip Client(BNC) is an multi-stream client designed for real-time GNSS applications."
arch=('x86_64')
url="https://igs.bkg.bund.de/root_ftp/NTRIP/documentation/BNC_BNS_RTNET_Concept.ppt"
license=('GPL-3.0-or-later')
groups=('GNSS')
depends=(
  'gcc-libs'
  'glibc'
  'qt5-base'
  'qt5-svg'
)
provides=("bnc=${pkgver}")
conflicts=("bnc")
replaces=()
backup=()
options=()
install=
source=(
  "https://igs.bkg.bund.de/root_ftp/NTRIP/software/BNC/bnc-${pkgver}-debian${_debianver}.zip" 
  "https://igs.bkg.bund.de/root_ftp/NTRIP/software/BNC/bnc-${pkgver}-debian${_debianver}.zip.sha256"
  "ntrip-logo.png::https://software.rtcm-ntrip.org/ntripLogo.png"
  "BNC_BNS_RTNET_Concept.ppt::https://igs.bkg.bund.de/root_ftp/NTRIP/documentation/BNC_BNS_RTNET_Concept.ppt"
  "bnc.desktop"
)
sha256sums=(
  'b13ff3d5564a46dac909a2213ea9b373db76bb5b4c9be28137096a304f20132e'  # bnc-${pkgver}-debian${_debianver}.zip
  'SKIP'                                                              # bnc-${pkgver}-debian${_debianver}.zip.sha256  # Checksums in the .sha256-file and of the downloaded .zip file do not match!!
  '97a17bead249ff7186992ff9518ce9a30df1ecaf8a7ba075adf783b836beee10'  # ntrip-logo.png
  'cd3972e41c76ece121ef73c51fbab93b53da697c42e2329c289f0d36d820cba3'  # BNC_BNS_RTNET_Concept.ppt
  '1fe01654d266fce5cd00b48be12cbd5712652e1b1d3830f7bb5d3493657d0605'  # bnc.desktop
)


package() {
  cd "${srcdir}"

  install -Dvm755 "bnc-${pkgver}" "${pkgdir}/usr/bin/bnc"
  install -Dvm644 "${srcdir}/ntrip-logo.png" "${pkgdir}/usr/share/pixmaps/bnc.png"
  install -Dvm644 "${srcdir}/bnc.desktop" "${pkgdir}/usr/share/applications/bnc.desktop"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/bnc"  CHANGELOG.md README "${srcdir}/BNC_BNS_RTNET_Concept.ppt"

  cp -rv Example_Configs "${pkgdir}/usr/share/doc/bnc"/

  install -Dvm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/bnc/LICENSE"
}
