# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ziipoo-bin
_pkgname=Ziipoo
pkgver=2601
pkgrel=1
pkgdesc="Makes music more reliable!壹谱,让音乐更靠谱!"
arch=('x86_64')
url="https://www.ziipoo.cn"
license=('custom')
options=(!strip)
providers=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip')
depends=('qt5-base' 'glibc' 'libglvnd' 'fontconfig' 'glib2' 'pango' 'libx11' 'alsa-lib' 'gtk2' 'zlib' 'lib32-gcc-libs' 'sh' 'ffmpeg4.4' \
    'libxi' 'gcc-libs' 'gtk3' 'libxxf86vm' 'libxtst' 'gdk-pixbuf2' 'cairo' 'at-spi2-core' 'libxext' 'java-runtime' 'freetype2' \
    'libxrender' 'lib32-glibc')
source=("${pkgname%-bin}-${pkgver}.deb::http://qdl.ziipoo.cn/soft/linux${_pkgname}${pkgver}v1.deb"
    "LICENSE.html::${url}/buy/")
sha256sums=('a65e50b53bae8b412f1403708eb5b940dcca4c128650006b0a8a51160faaf00f'
            '1dffba4ef854522d7c9c703c60229addc3b3768cb9dd410a2f17b3f988ad4fcf')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|usr/share|opt/${pkgname%-bin}|g" -i "${srcdir}/usr/share/${pkgname%-bin}/${pkgname%-bin}.sh"
    sed "s|/usr/share/${pkgname%-bin}/${pkgname%-bin}.sh|${pkgname%-bin}|g;s|/usr/share/${pkgname%-bin}/ic_launcher.png|${pkgname%-bin}|g;s|Audio|AudioVideo|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/usr/share/${pkgname%-bin}" "${pkgdir}/opt/"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/${pkgname%-bin}/ic_launcher.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    #find "${pkgdir}" -type d -exec chmod 755 {} \;
    #find "${pkgdir}" -type f -exec chmod 644 {} \;
    #chmod 755 "${pkgdir}/opt/${pkgname%-bin}/Ziipoo" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.sh"
}