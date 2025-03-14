# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor : HeartsDo <heartsdo[at]vivaldi[dot]net>
# Contributor : Colin Berry <colinb969 at gmail dot com>
pkgname=flashpoint-bin
_pkgname=Flashpoint
pkgver=14.0.1
pkgrel=1
pkgdesc="Launcher for BlueMaxima's Flashpoint - Infinity Edition.(Prebuilt version)"
arch=('x86_64')
url="https://flashpointarchive.org"
_ghurl="https://github.com/FlashpointProject"
license=('LicenseRef-freeware')
depends=(
    'nss>=3.0'
    'openssl-1.1'
    'php'
    'gtk3'
    'wine'
    'xorg-server'
    'sdl2'
    'java-runtime'
)
makedepends=(
    'gendesk'
    'p7zip'
)
optdepends=(
    'flashplayer-standalone: native Flash support'
    'gtk2'
    'libxt'
)
options=(
    '!strip'
    '!emptydirs'
)
noextract=("${pkgname%-bin}-${pkgver}.7z")
source=(
    "${pkgname%-bin}-${pkgver}.7z::https://download.unstable.life/upload/fp${pkgver}_lin_main_20250222.7z"
    "${pkgname%-bin}.png::${url}/w/resources/assets/path18-mw.png"
)
sha256sums=('bab843b8422da500056698819aa6752804eedb8ba130380403e4f49532d8537e'
            'cd1d182eb10cb346ec30fe730d3b42fe8ed66bd537c7ac835ccdab312f4e6260')
prepare(){
    install -Dm755 -d "${srcdir}/opt/${pkgname%-bin}"
    7zr x "${srcdir}/${pkgname%-bin}-${pkgver}.7z" -o"${srcdir}/opt/${pkgname%-bin}"
    gendesk -f -n -q --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="Game" --name="${_pkgname}" --exec="${pkgname%-bin}"
}
package(){
    cp -Pr --no-preserve=ownership "${srcdir}/opt" "${pkgdir}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/opt/${pkgname%-bin}/start-${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    chown -R "${USER}" "${pkgdir}/opt/${pkgname%-bin}"
}