# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tadabor-bin
pkgver=0.2.5
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
    "LICENSE::https://raw.githubusercontent.com/EnlightenCode/tadabor/main/LICENSE")
sha256sums=('8f0f2f45541dbd032463628d125f2ff848badfd7f00a902e19b30e158298fd73'
            '8f7b4c4dc6dabda329ce80a9ddc2b4ccb149966b04517de6ee2d2d7a30cc9ea0')
package() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    install -Dm755 -d "${pkgdir}/opt/" "${pkgdir}/usr"
    cp -r "${srcdir}/usr/lib/"* "${pkgdir}/opt"
    cp -r "${srcdir}/usr/share" "${pkgdir}/usr"
    sed 's|Exec=tadabor|Exec=/opt/tadabor/tadabor|g' -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}