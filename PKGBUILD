# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=rats-search
pkgname="${_pkgname}-appimage"
pkgver=1.10.0
pkgrel=2
pkgdesc="BitTorrent P2P multi-platform search engine for Desktop and Web servers with integrated torrent client."
arch=('x86_64')
url="https://github.com/DEgITx/rats-search"
license=(MIT)
providers=(DEgITx)
options=(!strip)
conflicts=("${_pkgname}")
depends=(hicolor-icon-theme zlib glibc)
_install_path="/opt/appimages"
source=("${_pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64.AppImage"
    "LICENSE::${url}/raw/master/LICENSE")
sha256sums=('2658d8ab42e0e4181c66dcbfd34673361c36ec42a20f8b5dea5347e104d5369b'
            'a0000d22d150a4a0133bee6c99e4248fa1e9c3aec8fa5a79cd911e605cdd1b5e')
prepare() {
    chmod a+x "${_pkgname}-${pkgver}.AppImage"
    "./${_pkgname}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's/AppRun/\/opt\/appimages\/rats-search.AppImage/g' -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${_pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}