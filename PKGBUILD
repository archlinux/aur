# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tadabor-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="An app that allows you to browse through the Quran and write your notes/reflections below the verses, everything will be saved in the application."
arch=('x86_64')
url="http://tadabor.surge.sh/"
_githuburl="https://github.com/EnlightenCode/tadabor-desktop"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-bin}")
depends=('nspr' 'nss' 'libdrm' 'mesa' 'glibc' 'libxkbcommon' 'dbus' 'expat' 'libxfixes' 'libxcb' 'libxext' 'gcc-libs' 'pango' \
    'libxcomposite' 'at-spi2-core' 'glib2' 'libcups' 'alsa-lib' 'libxrandr' 'gtk3' 'libx11' 'libxdamage' 'cairo')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/EnlightenCode/tadabor/master/LICENSE")
sha256sums=('c1a9cc70eeba3f51f514447cf5f74cf1fdb03725e3910cb1d91bd91decb3c642'
            'c55a4e23192e61a6c80cf58bfc7ae0b6f6598a0b27a0112558bd47d0d65f4d7c')
package() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    install -Dm755 -d "${pkgdir}/opt/" "${pkgdir}/usr"
    cp -r "${srcdir}/usr/lib/"* "${pkgdir}/opt"
    cp -r "${srcdir}/usr/share" "${pkgdir}/usr"
    sed 's|Exec=tadabor|Exec=/opt/tadabor/tadabor|g' -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}