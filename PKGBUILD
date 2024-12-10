# Maintainer: My Name <myemail@domain.me>

pkgname=xtplayer-bin
pkgver=v0.47b
pkgrel=1
pkgdesc="Cross platform Tcode player"
arch=('x86_64')
url="https://github.com/jcfain/XTPlayer"
license=('GPL-3.0-or-later')
depends=('zlib')
options=(!strip)
source_x86_64=(
        "${pkgname}-${pkgver}-x86_64.AppImage::https://github.com/jcfain/XTPlayer/releases/download/${pkgver}/XTPlayer-${pkgver}-Linux-x86_64.AppImage"
        "https://raw.githubusercontent.com/jcfain/XTPlayer/refs/tags/${pkgver}/src/images/icons/XTP-icon.png"
        "https://raw.githubusercontent.com/jcfain/XTPlayer/refs/tags/${pkgver}/XTPlayer.desktop"
)
noextract=("${pkgname}-${pkgver}-x86_64.AppImage")
sha256sums_x86_64=(
        '46da5b6bb1dbc7a20bbdf94216582f580e74776d8cc29dbd4345dcc31e9682c4'
        '337b37c44c6b72b0779f01654e5cddebbd13ffe6af621da427516744e4fc7493'
        'a37bf71f9641750830f0684dee3ff570c0bb07c0aa8ee3888fdcb88706b46e73'
        )

prepare() {
    sed -i -e "s@Exec=XTPlayer@Exec=${pkgname}@" -e "s@Icon=XTPlayer@Icon=${pkgname}@" XTPlayer.desktop
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-x86_64.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/XTP-icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
    install -Dm644 "${srcdir}/XTPlayer.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}
