# Maintainer: skrysz <skrysz+aur@skwall.pl>

pkgname=rtt-rstudio-technician
pkgver=5.5.191615
pkgrel=1
# INFO:
#   Intended for digital forensic labs, data recovery businesses, or individuals, it provides
#   them with a first-class professional data recovery tool set that can solve most of
#   the challenges they could ever face. Besides powerful data recovery features, it includes
#   a versatile file previewer that helps you estimate the chances for a successful data recovery,
#   a flexible RAID reconstruction module with custom-defined RAID configurations, modules for
#   data recovery over a network, and a professional text/hexadecimal editor; an all-in-one,
#   fully integrated application.
pkgdesc="R-Studio Technician is a powerful cost-effective undelete and data recovery software utility (non-free)."
arch=('x86_64' 'i686')
url="https://www.r-studio.com/Data_Recovery_Technician.shtml"
license=('custom')
depends=(
  'xdg-utils'
  'polkit'
  'hicolor-icon-theme'
  'gcc-libs'
  'glibc'
  'alsa-lib'
  'freetype2'
)
provides=('r-studio-technician-for-linux-bin')
conflicts=('r-studio-technician-for-linux-bin')
source=("${pkgname}-eula.html::https://www.r-studio.com/includes/eula/PopupEulaDRST.shtml?R-STUDIO%20Technician")
source_x86_64=("RStudioTech5_x64-${pkgver}.rpm::https://www.r-studio.com/downloads/RStudioTech5_x64.rpm")
source_i686=("RStudioTech5_i386-${pkgver}.rpm::https://www.r-studio.com/downloads/RStudioTech5_i386.rpm")
sha512sums=('7d0c133488f9f3d908a6668102bd713bfd621644cc5bbb34b283e94f6074b964da89ad1ec5ae63f721fc08d46a8bd39eedaebe96745314b7cd409dbf28dc5c43')
sha512sums_x86_64=('64ef059aecb0c12e4c2da53bb132b1bc9e40eb3d182a0b3fbe46ed5fe12c5f637b575da5d909e65b38e6e5fc95cef558a14fd63e89b07800a57c428984ca43ae')
sha512sums_i686=('7bfae3a651007f80d91780380b3e63402d0c99daa05e45d6ca5de4a9212e97e2e5547e84bc09032f82f887ddec11d2807029f93ac6ee32a58d2ba380f9f41feb')

package() {
  cd "${srcdir}"
  rm -rf "${srcdir}/usr/share"
  cp -ra "${srcdir}/usr" "${pkgdir}"
  install -Dm644 "${srcdir}/usr/local/R-Studio-Technician/share/rtt-rstudio-tech.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/usr/local/R-Studio-Technician/share/com.r-tt.pkexec.rstudio-tech.policy" "${pkgdir}/usr/share/polkit-1/actions/com.r-tt.pkexec.rstudio-tech.policy"
  for i in 16 24 32 48 64 256; do
    install -Dm644 "${pkgdir}/usr/local/R-Studio-Technician/share/logo_${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
    install -Dm644 "${pkgdir}/usr/local/R-Studio-Technician/share/logo_${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/rtt-rstudio-tech.png"
  done
  install -Dm644 "${srcdir}/${pkgname}-eula.html" "${pkgdir}/usr/share/licenses/${pkgname}/${pkgname}-eula.html"
}
