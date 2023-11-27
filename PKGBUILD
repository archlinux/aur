# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttkmusicplayer-bin
_pkgname=TTKMusicPlayer
pkgver=3.4.0.0
pkgrel=4
pkgdesc="TTKMusicPlayer that imitation Kugou music, the music player uses of qmmp core library based on Qt for windows and linux.(支持网易云音乐、酷我音乐、酷狗音乐)"
arch=('x86_64')
url="https://github.com/Greedysky/TTKMusicPlayer"
license=('GPL3' 'LGPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
noextract=("${pkgname%-bin}-${pkgver}.7z")
depends=(
    'qt5-multimedia'
    'qt5-webengine'
    'qt5-x11extras'
    'qt5-base'
    'libcups'
    'nspr'
    'nss'
    'libxcomposite'
    'libxcb'
    'libglvnd'
    'fontconfig'
    'freetype2'
    'gstreamer'
    'libxkbcommon'
    'libxrandr'
    'expat'
    'libpulse'
    'libxfixes'
    'libx11'
    'libxtst'
    'libxxf86vm'
    'libxrender'
    'gst-plugins-base-libs'
    'libxext'
    'libxcursor'
    'alsa-lib'
    'libxi'
    'libxdamage'
    'qt5-declarative'
)
makedepends=(
    'gendesk'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.7z::${url}/releases/download/${pkgver}/${pkgname%-bin}-linux-x64.7z"
)
sha256sums=('8e69eceff065b67479ecd38841287842c87c093e719a2596309476944d3a2809')
build() {
    gendesk -q -f -n --categories "AudioVideo;Player;Audio;Qt" --name "${_pkgname}" --exec "${pkgname%-bin}"
    mkdir -p "${srcdir}/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.7z" -C "${srcdir}/${pkgname%-bin}"
    rm -rf "${srcdir}/${pkgname%-bin}/Downloads"
    find "${srcdir}/${pkgname%-bin}" -type f -exec chmod 644 {} \;
    find "${srcdir}/${pkgname%-bin}" -type d -exec chmod 755 {} \;
    find "${srcdir}/${pkgname%-bin}" -type f -name "TTK*" -exec chmod 755 {} \;
    chmod 755 "${srcdir}/${pkgname%-bin}/${pkgver}/QtWebEngineProcess"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/AppRun" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}/deploy/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}