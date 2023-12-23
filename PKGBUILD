# Maintainer: skrysz <skrysz+aur@skwall.pl>

pkgname=rtt-rstudio-technician
pkgver=5.3.191246
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
source_x86_64=("https://www.r-studio.com/downloads/RStudioTech5_x64.rpm")
source_i686=("https://www.r-studio.com/downloads/RStudioTech5_i386.rpm")
sha512sums=('12263a744cc6e5113a3883edd99f341c61d3b06d74d0e6599373e4054354a81b0849d688bb031a41372f4ef23673f1b4c8153b6879ac0ba20650f9263d9eb27f')
sha512sums_x86_64=('8f714476b5cd49134eced2ed3482637568470fa7933d436a6d273e2f42c51f808ee2f8237eec9b243715679b5809200719068af3f68ba4a8ea510979a3e14a1f')
sha512sums_i686=('e4e1af83c51a20614fc30c3e25ceb6b182b0325139a886b66eda3e20422fc4040d5a4748981245f969e07116e23c241eac92fd91c5e2612f940ced2f43fd62c4')

package() {
  cd "${srcdir}"
  rm -rf "${srcdir}/usr/share"
  cp -ra "${srcdir}/usr" "${pkgdir}"
  install -Dm644 "${srcdir}/usr/local/R-Studio-Technician/share/rtt-rstudio-tech.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/usr/local/R-Studio-Technician/share/com.r-tt.pkexec.rstudio-tech.policy" "${pkgdir}/usr/share/polkit-1/actions/com.r-tt.pkexec.rstudio-tech.policy"
  for i in 16 24 32 48 64 256; do
    install -Dm644 "${pkgdir}/usr/local/R-Studio-Technician/share/logo_${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
  done
  install -Dm644 "${srcdir}/${pkgname}-eula.html" "${pkgdir}/usr/share/licenses/${pkgname}/${pkgname}-eula.html"
}
