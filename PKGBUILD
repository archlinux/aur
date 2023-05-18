# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=filecxx
pkgname=filecentipede-bin
pkgver=2.82
pkgrel=3
pkgdesc="Cross-platform internet upload/download manager for HTTP(S), FTP(S), SSH, magnet-link, BitTorrent, m3u8, ed2k, and online videos. WebDAV client, FTP client, SSH client."
arch=("x86_64")
url="http://www.filecxx.com/"
_githuburl="https://github.com/filecxx/FileCentipede"
license=('custom')
depends=('libjpeg-turbo' 'expat' 'libbsd' 'libxfixes' 'libxcb' 'libxau' 'xcb-util-image' 'libx11' 'graphite' 'libxshmfence' 'xcb-util-renderutil' \
    'libdrm' 'glib2' 'libice' 'dbus' 'brotli' 'pcre' 'libxext' 'util-linux-libs' 'libglvnd' 'qt5-svg' 'mesa' 'xcb-util-wm' 'qt5-base' 'zlib' \
    'libxdmcp' 'libxxf86vm' 'pcre2' 'xcb-util' 'libxkbcommon-x11' 'gcc-libs' 'libxkbcommon' 'libmd' 'libpng' 'zstd' 'harfbuzz' 'libsm' \
    'freetype2' 'xcb-util-keysyms' 'fontconfig')
makedepends=('gendesk')
conflicts=("${_pkgname}")
options=(!strip)
source=(
    "${_pkgname}_${pkgver}_linux_x64.zip::${_githuburl}/releases/download/v${pkgver}.0/${_pkgname}_${pkgver}_linux_x64.zip"
    "LICENSE.md::https://raw.githubusercontent.com/filecxx/FileCentipede/main/README.md"
)
sha256sums=('41932ebba913ed1de840ac32653d69fac67e44cf366b0fe7c58a4b50c1d9804d'
            '05c8805ca568d69e4bc1f33ae672eb1fa77c732972f701852295b8d5f2a07ed1')
 
package() {
    install -Dm755 -d "${pkgdir}/opt/${_pkgname}"
    bsdtar -xf "${_pkgname}_${pkgver}_linux_x64.zip" -C "${pkgdir}/opt/${_pkgname}/" --no-xattrs
    find "${pkgdir}" -type f -exec chmod 644 {} \;
    chmod +x "${pkgdir}/opt/${_pkgname}/file"* "${pkgdir}/opt/${_pkgname}/lib/file"*
    install -Dm644 "${pkgdir}/opt/${_pkgname}/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    gendesk -f --icon "${pkgname%-bin}" --categories "Utility;System" --name "FileCentipede文件蜈蚣" --exec "/opt/${_pkgname}/fileu"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}