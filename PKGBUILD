# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=filecentipede-bin
_pkgname=filecxx
pkgver=2.82
pkgrel=1
epoch=
pkgdesc="Cross-platform internet upload/download manager for HTTP(S), FTP(S), SSH, magnet-link, BitTorrent, m3u8, ed2k, and online videos. WebDAV client, FTP client, SSH client."
arch=("x86_64")
url="http://www.filecxx.com/"
license=('custom')
depends=(
    'pcre'
    'qt5-svg'
    'hicolor-icon-theme'
    'libbsd'
    'graphite'
)
optdepends=()
provides=(filecxx)
conflicts=()
install=
source=(
    "${_pkgname}_${pkgver}_linux_x64.zip::https://github.com/filecxx/FileCentipede/raw/main/release/filecxx_latest_linux_x64.zip"
    "LICENSE::https://github.com/filecxx/FileCentipede/raw/main/README.md"
    "${pkgname}.desktop"
    )
sha256sums=('41932ebba913ed1de840ac32653d69fac67e44cf366b0fe7c58a4b50c1d9804d'
            '3d681f308f0c2eee560aa31e2687b5285ecd78c79eef5b3aa5f0e4bf0009e6db'
            'e7042d7b1f91ac8d0398d40b3e82701c74876a1ac980a769791bd1a013c85b49')
 
prepare() {
    mkdir -p "${srcdir}/opt/${pkgname}"
    unzip "${_pkgname}_${pkgver}_linux_x64.zip" -d "${srcdir}/opt/${pkgname}/"
}
 
package() {
    cp -r ${srcdir}/opt "${pkgdir}"
    #install icons
    install -Dm644 "${srcdir}/opt/${pkgname}/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.png"
    #install license
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/license.html"
    #install desktop
    install -Dm 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
