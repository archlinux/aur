# Maintainer: Ash <xash at riseup d0t net>
pkgname=sssvrecompiled-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Space Station Silicon Valley: Recompiled (prebuilt binary)"
arch=('x86_64')
url="https://github.com/Cellenseres/SSSV_Recomp"
license=('none')
depends=(
  'glibc'
  'gcc-libs'
  'hicolor-icon-theme'
  'vulkan-driver'
  'libx11'
  'libxrandr'
  'libxinerama'
  'libxcursor'
  'libxi'
)
options=('!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/Cellenseres/SSSV_Recomp/releases/download/v${pkgver}/SSSVRecompiled_v${pkgver}_Linux.tar.gz"
  "https://raw.githubusercontent.com/Cellenseres/SSSV_Recomp/main/icons/512.png"
  "sssvrecompiled-wrapper"
  "sssvrecompiled.desktop"
)
sha256sums=('fd1dc25d490e3861ea6279a7dd2c28aa03ac7c506775be3c4817a6fe08b8201c'
            '64de66d862803eafd690dc21a53e4ebc62750f8048e7be95aaa42b00fc888844'
            '8665a991f5f9ca4b24a4f73d97351e57385d893d05ec3857cf63126a64739003'
            'd669b7c0071abfd3b5f5040ff10e7ebf7aae948e5db6484c69f2b88ace1d5a7b')

package() {
  cd "${srcdir}"

  # install upstream files to /opt
  install -d "${pkgdir}/opt/SSSVRecompiled"
  install -m755 "${srcdir}/SSSVRecompiled" \
    "${pkgdir}/opt/SSSVRecompiled/SSSVRecompiled"
  cp -a "${srcdir}/assets" \
    "${pkgdir}/opt/SSSVRecompiled/"
  install -m644 "${srcdir}/recompcontrollerdb.txt" \
    "${pkgdir}/opt/SSSVRecompiled/"

  # install wrapper as the user-facing command
  install -Dm755 "${srcdir}/sssvrecompiled-wrapper" \
    "${pkgdir}/usr/bin/SSSVRecompiled"

  # app icon
  install -Dm644 "${srcdir}/512.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/sssvrecompiled.png"

  # desktop entry
  install -Dm644 "${srcdir}/sssvrecompiled.desktop" \
    "${pkgdir}/usr/share/applications/sssvrecompiled.desktop"
}
