# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor : HeartsDo <heartsdo[at]vivaldi[dot]net>
# Contributor : Colin Berry <colinb969 at gmail dot com>
pkgname=flashpoint-bin
_pkgname=Flashpoint
pkgver=12.1
pkgrel=2
pkgdesc="Launcher for BlueMaxima's Flashpoint - Infinity Edition."
arch=('x86_64')
url="https://flashpointarchive.org"
_ghurl="https://github.com/FlashpointProject"
license=('custom:freeware')
depends=(
    'nss>=3.0'
    'php'
    'gtk3'
    'libxss'
    'wine'
    'pipewire-pulse'
    'xorg-server'
    'lib32-libxcomposite'
)
makedepends=(
    'gendesk'
)
optdepends=(
    'flashplayer-standalone: native Flash support'
    'gtk2'
    'libxt'
)
noextract=("${pkgname%-bin}-${pkgver}.7z")
source=(
    "${pkgname%-bin}-${pkgver}.7z::https://download.unstable.life/upload/fp${pkgver//./}_linux_111123.7z"
    "${pkgname%-bin}.png::${url}/w/resources/assets/path18-mw.png"
)
sha256sums=('bc388687e17e9b548c4eb5823364720f6b0da21bb49fc69177ba79d870bcb64f'
            'cd1d182eb10cb346ec30fe730d3b42fe8ed66bd537c7ac835ccdab312f4e6260')
build(){
    install -Dm755 -d "${srcdir}/opt/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.7z" -C "${srcdir}/opt/${pkgname%-bin}"
    gendesk -f -n -q --categories "Game" --name "${_pkgname}" --exec "${pkgname%-bin}"
}
package(){
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/opt/${pkgname%-bin}/start-${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}