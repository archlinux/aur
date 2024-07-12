# Maintainer: skrysz <skrysz+aur@skwall.pl>

pkgname=rtt-rstudio-technician
pkgver=5.4.191332
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
sha512sums=('12263a744cc6e5113a3883edd99f341c61d3b06d74d0e6599373e4054354a81b0849d688bb031a41372f4ef23673f1b4c8153b6879ac0ba20650f9263d9eb27f')
sha512sums_x86_64=('f23976c2bfe5d13b5ac96f507152cd36761c389843c6756ff6a6f419e62cfcb635b7d118be1e166210dd0bbcc8e65b729d6fbd072dc4ed7a31f2dfeab1053429')
sha512sums_i686=('d9ec7fa4f56c1c53054b4290244eedfc3d15afa6513468fc17d6e0d629ff515dc49df0d441d227e39d5cde0820f06db4293d01f7a038e11e3446f877b3958f7f')

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
