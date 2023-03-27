# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=ttkmusicplayer
pkgname="${_pkgname}-bin"
pkgver=3.2.0.0
pkgrel=2
pkgdesc="TTKMusicPlayer that imitation Kugou music, the music player uses of qmmp core library based on Qt for windows and linux.(支持网易云音乐、酷我音乐、酷狗音乐)"
arch=('x86_64')
url="https://github.com/Greedysky/TTKMusicPlayer"
license=('GPL3')
conflicts=("${_pkgname}")
noextract=("${_pkgname}-${pkgver}.7z")
depends=(qt5-multimedia qt5-webengine qt5-x11extras qt5-base libcups nspr nss libxcomposite libxext libxcursor alsa-lib bash \
    glib2 zlib libxcb libglvnd fontconfig freetype2 gstreamer libxkbcommon libxrandr gcc-libs libxi libxdamage qt5-declarative \
    glibc expat libpulse libxfixes libx11 libxtst libxxf86vm libxrender gst-plugins-base-libs hicolor-icon-theme dbus)
source=("${_pkgname}-${pkgver}.7z::${url}/releases/download/${pkgver}/${_pkgname}-linux-x64.7z"
        "${_pkgname}.desktop")
sha256sums=('e0422e488429b8ce7c23716f26368f1346910b8ac4f0bca63e2e8c8cf88814cc'
            'dd86a87a220ae12b5f0737be7bbad8bdaad3970a60b2244ec55b100293091fef')
package() {
    install -Dm755 -d "${pkgdir}/opt/${_pkgname}"
    bsdtar -xf "${_pkgname}-${pkgver}.7z" -C "${pkgdir}/opt/${_pkgname}"
    find "${pkgdir}" -type f -exec chmod 644 {} \;
    find "${pkgdir}" -type d -exec chmod 755 {} \;
    chmod 755 "${pkgdir}/opt/${_pkgname}/"*.sh "${pkgdir}/opt/${_pkgname}/"TTK* "${pkgdir}/opt/${_pkgname}/${pkgver}/"*.sh "${pkgdir}/opt/${_pkgname}/${pkgver}/"TTK*
    rm -r "${pkgdir}/opt/${_pkgname}/Downloads"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/${_pkgname}/deploy/share/pixmaps/ttkmusicplayer.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
}
