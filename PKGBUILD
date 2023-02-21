# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=baidu-translate-client
pkgver=1.6.0
pkgrel=1
pkgdesc="百度翻译桌面端,轻·快的多语种翻译工具"
arch=('x86_64')
url="https://fanyi.baidu.com/"
license=('custom')
conflicts=('baidu-translate-client-bin')
provides=('Baidu')
depends=(
    'libxtst'
    'libxkbcommon-x11'
    'hicolor-icon-theme'
)
options=()
source=(
  "${pkgname}-${pkgver}.exe::https://webcdn.m.qq.com/spcmgr/download/BDFY_Setup_1.6.0.exe"
  'baidu-translate-client.svg'
  'baidu-translate-client.desktop'
)
md5sums=('19f4c9cc1f64a33fccc0f0fc753474a6'
         '3421a1b152f45d0b31930709209ade2f'
         'a346a32eb76c25a86cde7b7d6ca2e155')
   
prepare() {
    7z x -aoa "${pkgname}-${pkgver}.exe"
    mkdir -p "${srcdir}/opt/${pkgname}/"
    7z x -aoa "${srcdir}/\$PLUGINSDIR/app-64.7z" -o"${srcdir}/opt/${pkgname}/"
    mv "${srcdir}/opt/${pkgname}/百度翻译.exe" "${srcdir}/opt/${pkgname}/${pkgname}"
    chmod +x "${srcdir}/opt/${pkgname}/${pkgname}"
    find "${srcdir}/opt/${pkgname}/" -type d -exec chmod 755 {} \;
}
   
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/opt/${pkgname}/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}