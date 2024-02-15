# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

pkgname=bnc-bin
_debianver=12
pkgver=2.13.0
pkgrel=1
pkgdesc="The BKG Ntrip Client(BNC) is an multi-stream client designed for real-time GNSS applications."
arch=('x86_64')
url="http://www.rtklib.com/"
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
  "ntrip-logo.png::https://software.rtcm-ntrip.org/ntripLogo.png"
  "bnc.desktop"
)
sha256sums=(
  'dc920787d64bc0ea4af45cce164d7cad4b7262692076af5af3319887d54523da'
  '97a17bead249ff7186992ff9518ce9a30df1ecaf8a7ba075adf783b836beee10'
  '1fe01654d266fce5cd00b48be12cbd5712652e1b1d3830f7bb5d3493657d0605'
)


package() {
  cd "${srcdir}/bnc-${pkgver}-debian${_debianver}"

  install -Dvm755 "bnc-${pkgver}" "${pkgdir}/usr/bin/bnc"
  install -Dvm644 "${srcdir}/ntrip-logo.png" "${pkgdir}/usr/share/pixmaps/bnc.png"
  install -Dvm644 "${srcdir}/bnc.desktop" "${pkgdir}/usr/share/applications/bnc.desktop"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/bnc"  CHANGELOG.md README

  cp -rv Example_Configs "${pkgdir}/usr/share/doc/bnc"/

  install -Dvm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/bnc/LICENSE"
}
