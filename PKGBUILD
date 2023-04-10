# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xnview-xnsketch-bin
_pkgname=XnSketch
pkgver=1.20
pkgrel=2
pkgdesc="Allows you to turn your photos into cartoon or sketch images."
arch=('x86_64')
url="https://www.xnview.com/en/xnsketch/"
license=('custom')
conflicts=()
depends=('gtk2' 'at-spi2-core' 'sh' 'libxext' 'cairo' 'qt5-base' 'libglvnd' 'gdk-pixbuf2' 'glibc' 'libxi' 'gcc-libs' \
  'fontconfig' 'libxrender' 'libx11' 'glib2' 'libice' 'hicolor-icon-theme' 'pango' 'freetype2' 'libxcb' 'libsm')
options=()
source=(
  "${_pkgname}-${pkgver}.tgz::https://download.xnview.com/XnSketch-linux-x64.tgz"
)
sha512sums=('56365b3977241a60f6b592c3dc41bb6e2d829aabc3061aaad10a660b9b070d33035f387c57ebfa8630ee796d80bcdef23b231608689821f0107eb9fa5ace62f7')
   
package() {
  install -Dm755 -d "${pkgdir}/opt/"
  bsdtar -xvf ${_pkgname}-${pkgver}.tgz -C "${pkgdir}/opt/" --gname root --uname root
  chmod 644 "${pkgdir}/opt/${_pkgname}/xnsketch.png"
  sed 's|Exec=/home/pierre/Desktop/XnSketch/|Exec=/opt/XnSketch/|g;s|/home/pierre/Desktop/XnSketch/xnsketch.png|xnsketch|g' -i "${pkgdir}/opt/${_pkgname}/${_pkgname}.desktop"
  install -Dm644 "${pkgdir}/opt/${_pkgname}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${pkgdir}/opt/${_pkgname}/xnsketch.png" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 "${pkgdir}/opt/${_pkgname}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}