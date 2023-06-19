# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=xnsketch
pkgname="xnview-${_appname}-bin"
_pkgname=XnSketch
pkgver=1.20
pkgrel=3
pkgdesc="Allows you to turn your photos into cartoon or sketch images."
arch=('i686' 'x86_64')
url="https://www.xnview.com/en/xnsketch/"
license=('custom')
depends=('gtk2' 'at-spi2-core' 'sh' 'libxext' 'cairo' 'qt5-base' 'libglvnd' 'gdk-pixbuf2' 'glibc' 'libxi' 'gcc-libs' \
  'fontconfig' 'libxrender' 'libx11' 'glib2' 'libice' 'pango' 'freetype2' 'libxcb' 'libsm')
source_i686=("${pkgname%-bin}-${pkgver}-i686.tgz::https://download.xnview.com/XnSketch-linux.tgz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tgz::https://download.xnview.com/XnSketch-linux-x64.tgz")
noextract=("${pkgname%-bin}-${pkgver}-${CARCH}.tgz")
sha256sums_i686=('bfc35afc4e333db3cc298bffda1f35beca45e8b1b693bc9a45c5bceb161ceae2')
sha256sums_x86_64=('15273b7e38bcac2b4a34034e383547243b3d086ac57259629e49afabe4adace5')
   
package() {
  install -Dm755 -d "${pkgdir}/opt/"
  bsdtar -xvf "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.tgz" -C "${pkgdir}/opt/" --gname root --uname root
  sed "s|Exec=/home/pierre/Desktop/${_pkgname}/|Exec=/opt/${_pkgname}/|g;s|/home/pierre/Desktop/${_pkgname}/${_appname}.png|${_appname}|g" \
    -i "${pkgdir}/opt/${_pkgname}/${_pkgname}.desktop"
  install -Dm644 "${pkgdir}/opt/${_pkgname}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${pkgdir}/opt/${_pkgname}/xnsketch.png" -t "${pkgdir}/usr/share/pixmaps"
  install -Dm644 "${pkgdir}/opt/${_pkgname}/license.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}