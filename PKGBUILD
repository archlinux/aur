# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=filecxx
pkgname=filecentipede-bin
pkgver=2.82
pkgrel=2
pkgdesc="Cross-platform internet upload/download manager for HTTP(S), FTP(S), SSH, magnet-link, BitTorrent, m3u8, ed2k, and online videos. WebDAV client, FTP client, SSH client."
arch=("x86_64")
url="http://www.filecxx.com/"
_githuburl="https://github.com/filecxx/FileCentipede"
license=('custom')
depends=(pcre pcre2 qt5-svg hicolor-icon-theme libbsd graphite qt5-base libglvnd xcb-util-keysyms mesa zlib libx11  pcre2 libjpeg-turbo libxau brotli xcb-util-keysyms \
    libpng libxkbcommon-x11 libxshmfence libmd libxfixes fontconfig glib2 libxkbcommon brotli libsm xcb-util-wm xcb-util xcb-util-image libjpeg-turbo \
    libxcb libxext dbus xcb-util-renderutil libice libxxf86vm harfbuzz freetype2 util-linux-libs expat libdrm zstd gcc-libs libxdmcp xcb-util-renderutil )
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
    "${_pkgname}_${pkgver}_linux_x64.zip::${_githuburl}/releases/download/v${pkgver}.0/${_pkgname}_${pkgver}_linux_x64.zip"
    "LICENSE::${_githuburl}/raw/main/README.md"
    "${_pkgname}.desktop"
    )
sha256sums=('41932ebba913ed1de840ac32653d69fac67e44cf366b0fe7c58a4b50c1d9804d'
            '3d681f308f0c2eee560aa31e2687b5285ecd78c79eef5b3aa5f0e4bf0009e6db'
            '64720737bca2e8d9df144c1e6e70f93f822f48261410b20a8daf3462974b295f')
 
package() {
    install -Dm755 -d "${pkgdir}/opt/${_pkgname}"
    bsdtar -xf "${_pkgname}_${pkgver}_linux_x64.zip" -C "${pkgdir}/opt/${_pkgname}/" --no-xattrs
    find "${pkgdir}" -type f -exec chmod 644 {} \;
    chmod +x "${pkgdir}/opt/${_pkgname}/file"* "${pkgdir}/opt/${_pkgname}/lib/file"*
    install -Dm644 "${pkgdir}/opt/${_pkgname}/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}