# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="ttkmusicplayer-bin"
pkgver=3.3.0.0
pkgrel=1
pkgdesc="TTKMusicPlayer that imitation Kugou music, the music player uses of qmmp core library based on Qt for windows and linux.(支持网易云音乐、酷我音乐、酷狗音乐)"
arch=('x86_64')
url="https://github.com/Greedysky/TTKMusicPlayer"
license=('GPL3')
conflicts=("${pkgname%-bin}")
noextract=("${pkgname%-bin}-${pkgver}.7z")
depends=('qt5-multimedia' 'qt5-webengine' 'qt5-x11extras' 'qt5-base' 'libcups' 'nspr' 'nss' 'libxcomposite' \
    'glib2' 'zlib' 'libxcb' 'libglvnd' 'fontconfig' 'freetype2' 'gstreamer' 'libxkbcommon' 'libxrandr' 'gcc-libs' \
    'glibc' 'expat' 'libpulse' 'libxfixes' 'libx11' 'libxtst' 'libxxf86vm' 'libxrender' 'gst-plugins-base-libs' \
    'dbus' 'libxext' 'libxcursor' 'alsa-lib' 'sh' 'libxi' 'libxdamage' 'qt5-declarative')
makedepends=('gendesk')
#options=(!strip)
source=("${pkgname%-bin}-${pkgver}.7z::${url}/releases/download/${pkgver}/${pkgname%-bin}-linux-x64.7z")
sha256sums=('faf2f6d37ba8226e1e49a65d2c6d8f8bebc5dcf02f1e82b70cbf773a3e39280a')
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    bsdtar -xf "${pkgname%-bin}-${pkgver}.7z" -C "${pkgdir}/opt/${pkgname%-bin}"
    find "${pkgdir}" -type f -exec chmod 644 {} \;
    find "${pkgdir}" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/${pkgname%-bin}" -type f -name "TTK*" -exec chmod 755 {} \;
    rm -rf "${pkgdir}/opt/${pkgname%-bin}/Downloads"
    gendesk -f --icon "${pkgname%-bin}" --categories "AudioVideo;Player;Audio;Qt" --name "TTKMusicPlayer" --exec "/opt/${pkgname%-bin}/TTKMusicPlayer"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/deploy/share/pixmaps/ttkmusicplayer.png" -t "${pkgdir}/usr/share/pixmaps"
}