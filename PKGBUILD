# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=photosir-himirage-bin
_appname=cn.photosir.himirage
pkgver=2.0.4.30721
_armver=2.0.6.30904
pkgrel=1
pkgdesc="A multifunctional image processing software.悟空图像是一款多功能图像处理软件"
arch=('aarch64' 'x86_64')
license=('GPL2')
url="https://photosir.com"
conflicts=("${pkgname%-bin}" "${_appname}")
depends=(
    'pango'
    'qt5-serialport'
    'qt5-location'
    'qt5-declarative'
    'xcb-util-renderutil'
    'hicolor-icon-theme'
    'lame'
    'libdrm'
    'qt5-webengine'
    'xcb-util-image'
    'libxrender'
    'xcb-util-keysyms'
    'libxkbcommon'
    'libxcomposite'
    'dbus'
    'nss'
    'bash'
    'libpulse'
    'xcb-util'
    'libogg'
    'libxcursor'
    'xz'
    'qt5-base'
    'opus'
    'lcms2'
    'expat'
    'ffmpeg'
    'gstreamer'
    'fontconfig'
    'cairo'
    'glib2'
    'libvdpau'
    'qt5-websockets'
    'krb5'
    'unixodbc'
    'libxcb'
    'libxfixes'
    'wayland'
    'qt5-multimedia'
    'libcups'
    'gtk3'
    'gtk2'
    'libvorbis'
    'libxi'
    'qt5-webchannel'
    'libglvnd'
    'libx11'
    'libxtst'
    'nspr'
    'postgresql-libs'
    'at-spi2-core'
    'kguiaddons5'
    'qt5-wayland'
    'freetype2'
    'alsa-lib'
    'gdk-pixbuf2'
    'libxdamage'
    'qt5-xmlpatterns'
    'libxkbcommon-x11'
    'xcb-util-wm'
    'gst-plugins-base-libs'
    'libxext'
    'qt5-svg'
    'qt5-sensors'
    'libxrandr'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::https://cdn.photosir.cn/package/uos/30721/signed_${_appname}_${_armver}-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::https://cdn.photosir.cn/package/uos/30721/signed_${_appname}_${pkgver}-amd64.deb")
source=(
    "LICENSE.html::https://user.photosir.com/static/user_agreement_zh-cn.html"
    "${pkgname%-bin}.sh")

sha256sums=('eed15a6f6ec3b27f402adbb3541688c3943c945dff858b2689adcbe603006738'
            'ca610f1c46fb4281592eed96d7c46cea5d7c461409dd415f30515c8ab314ea92')
sha256sums_aarch64=('4065c14cf71f775f09685043a93384c911b3294b078f1a6bac75f7f6434c9553')
sha256sums_x86_64=('101a9adc01fecdb6b6496fe76cc334c5776de1467543fbd27a93f171cba48ce2')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed -e "s|/opt/apps/${_appname}/files/himirage.sh %F|${pkgname%-bin}|g" \
        -e "s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -e "s|Name=${_appname}|Name=${pkgname%-bin}|g" \
        -i "${srcdir}/opt/apps/${_appname}/entries/applications/${_appname}.desktop"
}
package(){
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/opt/apps/${_appname}/files/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/apps/${_appname}/entries/applications/${_appname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 24x24 32x32 48x48 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/opt/apps/${_appname}/entries/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
        install -Dm644 "${srcdir}/opt/apps/${_appname}/entries/icons/hicolor/${_icons}/mimetypes/himirage.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/mimetypes/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/opt/apps/${_appname}/entries/mime/packages/${_appname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname%-bin}.xml"
    install -Dm644 "${srcdir}/opt/apps/${_appname}/files/doc/${_appname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}