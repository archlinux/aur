# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mootool-bin
_appname=MooTool
pkgver=1.4.5
pkgrel=2
pkgdesc="Handy tool set for developers. 开发者常备小工具"
arch=("x86_64")
url="https://github.com/rememberber/MooTool"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('libxrender' 'libx11' 'glibc' 'zlib' 'freetype2' 'java-runtime' 'libxext' 'libxi' 'alsa-lib' 'libxtst' 'sh')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_appname}_${pkgver}.deb"
    "LICENSE::https://raw.githubusercontent.com/rememberber/MooTool/master/LICENSE.txt")
sha256sums=('d4b5a5027fe616d8f8bda1a05884b86b688ef6f3c82fd52613a672327c76111e'
            '91930d61ff6e2bd3ceaf0ac0de4431d4ede9a9a940ca327367820df54762e333')
package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    rm -rf "${pkgdir}/usr/local"
    sed "s|Icon=/opt/${_appname}/${_appname}.png|Icon=${_appname}|g" -i "${pkgdir}/usr/share/applications/${_appname}.desktop"
    install -Dm644 "${pkgdir}/opt/${_appname}/${_appname}.png" -t "${pkgdir}/usr/share/pixmaps"
}