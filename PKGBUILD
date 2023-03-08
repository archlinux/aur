# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttkmusicplayer-bin
_pkgname=TTKMusicPlayer
pkgver=3.2.0.0
pkgrel=1
pkgdesc="TTKMusicPlayer that imitation Kugou music, the music player uses of qmmp core library based on Qt for windows and linux.(支持网易云音乐、酷我音乐、酷狗音乐)"
arch=('x86_64')
url="https://github.com/Greedysky/TTKMusicPlayer"
license=('GPL3')
options=()
conflicts=()
depends=(qt5-multimedia qt5-webengine qt5-x11extras)
source=("${_pkgname}-${pkgver}.7z::${url}/releases/download/${pkgver}/${_pkgname}-linux-x64.7z"
        "${_pkgname}.desktop")
sha512sums=('0b8a4bb915219de6e515091bff42331eb781d6c40b5260995257238689c38f0448296badab1387a88011644ab7b4a8562a2f8be02fcde54aa4eadd896776d219'
            '1b0abb8d6ad45d01d97c8475707e596c258c722743f98e6ea7d60e685ed174a68c6299c098aa4c803d23992c4fe6398decdf9cf3277cbdb6f58540d404518b62')
prepare() {
    mkdir -p "${srcdir}/opt/${_pkgname}"
    bsdtar -xf "${_pkgname}-${pkgver}.7z" -C "${srcdir}/opt/${_pkgname}"
    chmod 755 "${srcdir}/opt/${_pkgname}/"*.sh "${srcdir}/opt/${_pkgname}/"TTK* "${srcdir}/opt/${_pkgname}/${pkgver}/"*.sh "${srcdir}/opt/${_pkgname}/${pkgver}/"TTK*
    rm -r "${srcdir}/opt/${_pkgname}/Downloads"
}
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/opt/TTKMusicPlayer/deploy/share/pixmaps/ttkmusicplayer.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
}
