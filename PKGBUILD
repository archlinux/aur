# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=filecxx
pkgname=filecentipede-bin
pkgver=2.82
pkgrel=6
pkgdesc="Cross-platform internet upload/download manager for HTTP(S), FTP(S), SSH, magnet-link, BitTorrent, m3u8, ed2k, and online videos. WebDAV client, FTP client, SSH client."
arch=("x86_64")
url="http://www.filecxx.com/"
_ghurl="https://github.com/filecxx/FileCentipede"
license=('custom')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${pkgname%-bin}")
depends=(
    'libjpeg-turbo'
    'expat'
    'libbsd'
    'libxfixes'
    'libxcb'
    'libxau'
    'xcb-util-image'
    'libx11'
    'graphite'
    'libxshmfence'
    'xcb-util-renderutil'
    'libdrm'
    'glib2'
    'libice'
    'dbus'
    'brotli'
    'pcre'
    'libxext'
    'util-linux-libs'
    'libglvnd'
    'qt5-svg'
    'mesa'
    'xcb-util-wm'
    'qt5-base'
    'zlib'
    'libxdmcp'
    'libxxf86vm'
    'pcre2'
    'xcb-util'
    'libxkbcommon-x11'
    'gcc-libs'
    'libxkbcommon'
    'libmd'
    'libpng'
    'zstd'
    'harfbuzz'
    'libsm'
    'freetype2'
    'xcb-util-keysyms'
    'fontconfig'
)
makedepends=(
    'gendesk'
)
optdepends=(
    'qt6-wayland'
)
noextract=("${pkgname%-bin}-${pkgver}.zip")
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}.0/${_pkgname}_${pkgver}_linux_x64.zip"
    "LICENSE.md::https://raw.githubusercontent.com/filecxx/FileCentipede/v${pkgver}.0/README.md"
)
sha256sums=('41932ebba913ed1de840ac32653d69fac67e44cf366b0fe7c58a4b50c1d9804d'
            '3d681f308f0c2eee560aa31e2687b5285ecd78c79eef5b3aa5f0e4bf0009e6db')
build() {
    gendesk -f -n -q --categories "Utility;System" --name "FileCentipede文件蜈蚣" --exec "${pkgname%-bin}"
    mkdir -p "${srcdir}/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${srcdir}/${pkgname%-bin}"
    find "${srcdir}/${pkgname%-bin}" -type f -perm 600 -exec chmod 644 {} \;
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/fileu" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}