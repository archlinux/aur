# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=himirage
pkgname="photosir-${_appname}-bin"
_pkgname="cn.photosir.${_appname}"
pkgver=2.0.4.30721
_armver=2.0.6.30904
pkgrel=4
pkgdesc="A multifunctional image processing software.悟空图像是一款多功能图像处理软件"
arch=(
    'aarch64'
    'x86_64'
)
license=('GPL-2.0-or-later')
url="https://photosir.com"
conflicts=(
    "${pkgname%-bin}"
    "${_pkgname}"
)
provides=("${pkgname%-bin}")
depends=(
    'gtk2'
    'gtk3'
    'ffmpeg'
    'nspr'
    'nss'
    'postgresql-libs'
    'qt5-base'
    'qt5-connectivity'
    'qt5-declarative'
    'qt5-location'
    'qt5-multimedia'
    'qt5-quickcontrols2'
    'qt5-remoteobjects'
    'qt5-sensors'
    'qt5-serialport'
    'qt5-speech'
    'qt5-svg'
    'qt5-tools'
    'qt5-wayland'
    'qt5-webchannel'
    'qt5-webengine'
    'qt5-websockets'
    'qt5-xmlpatterns'
    'qt6-declarative'
    'qt6-multimedia'
    'unixodbc'
    'xcb-util'
    'xcb-util-image'
    'xcb-util-keysyms'
    'xcb-util-renderutil'
    'xcb-util-wm'
    'ki18n5'
    'kcoreaddons5'
    'kconfig5'
    'kguiaddons5'
    'kwidgetsaddons5'
    'kitemviews5'
)
options=('!strip')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::https://cdn.photosir.cn/package/uos/30721/signed_${_pkgname}_${_armver}-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::https://cdn.photosir.cn/package/uos/30721/signed_${_pkgname}_${pkgver}-amd64.deb")
source=("${pkgname%-bin}.sh")
sha256sums=('dd26f33e5977a841f2bbdb25f622cb4b8e81e676b76c71909ed8f14e32b66de5')
sha256sums_aarch64=('4065c14cf71f775f09685043a93384c911b3294b078f1a6bac75f7f6434c9553')
sha256sums_x86_64=('101a9adc01fecdb6b6496fe76cc334c5776de1467543fbd27a93f171cba48ce2')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_appname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "s|/opt/apps/${_pkgname}/files/himirage.sh|${pkgname%-bin}|g" \
        -e "s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -e "s|Name=${_pkgname}|Name=${pkgname%-bin}|g" \
        -i "${srcdir}/opt/apps/${_pkgname}/entries/applications/${_pkgname}.desktop"
}
package(){
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/opt/apps/${_pkgname}/files/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/entries/applications/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 24x24 32x32 48x48 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/opt/apps/${_pkgname}/entries/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
        install -Dm644 "${srcdir}/opt/apps/${_pkgname}/entries/icons/hicolor/${_icons}/mimetypes/himirage.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/mimetypes/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/entries/mime/packages/${_pkgname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname%-bin}.xml"
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/files/doc/${_pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}