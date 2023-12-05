# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=xnsketch
pkgname="xnview-${_appname}-bin"
_pkgname=XnSketch
pkgver=1.20
pkgrel=6
pkgdesc="Allows you to turn your photos into cartoon or sketch images."
arch=(
  'i686'
  'x86_64'
)
url="https://www.xnview.com/en/xnsketch/"
license=('custom')
depends=(
  'gtk2'
  'at-spi2-core'
  'libxext'
  'cairo'
  'qt5-base'
  'libglvnd'
  'gdk-pixbuf2'
  'libxi'
  'fontconfig'
  'libxrender'
  'libx11'
  'libice'
  'pango'
  'freetype2'
  'libxcb'
  'libsm'
  'icu'
)
source_i686=("${pkgname%-bin}-${pkgver}-i686.tgz::https://download.xnview.com/XnSketch-linux.tgz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tgz::https://download.xnview.com/XnSketch-linux-x64.tgz")
source=("${pkgname%-bin}.sh")
sha256sums=('8d29d634e1d193ed932e4f852fa505c667a4d80695697a79acaf90b055432958')
sha256sums_i686=('bfc35afc4e333db3cc298bffda1f35beca45e8b1b693bc9a45c5bceb161ceae2')
sha256sums_x86_64=('15273b7e38bcac2b4a34034e383547243b3d086ac57259629e49afabe4adace5')
build() {
    sed -e "s|/home/pierre/Desktop/${_pkgname}/${_appname}.sh|${pkgname%-bin}|g" \
        -e "s|/home/pierre/Desktop/${_pkgname}/${_appname}.png|${pkgname%-bin}|g" \
        -i "${srcdir}/${_pkgname}/${_pkgname}.desktop"
    chmod a+r "${srcdir}/${_pkgname}/${_appname}.png"
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    ln -sf "/usr/lib/libicui18n.so" "${pkgdir}/opt/${pkgname%-bin}/lib/libicui18n.so.54"
    ln -sf "/usr/lib/libicuuc.so" "${pkgdir}/opt/${pkgname%-bin}/lib/libicuuc.so.54"
    ln -sf "/usr/lib/libicudata.so" "${pkgdir}/opt/${pkgname%-bin}/lib/libicudata.so.54"
    install -Dm644 "${srcdir}/${_pkgname}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/${_pkgname}/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${_pkgname}/license.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}