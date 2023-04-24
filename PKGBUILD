# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="ziipoo-bin"
pkgver=2585
pkgrel=1
pkgdesc="Makes music more reliable!壹谱,让音乐更靠谱!"
arch=('x86_64')
url="https://www.ziipoo.cn"
license=('custom')
options=(!strip)
providers=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('qt5-base' 'glibc' 'libglvnd' 'fontconfig' 'glib2' 'pango' 'libx11' 'alsa-lib' 'gtk2' 'zlib' 'lib32-gcc-libs' 'sh' \
    'libxi' 'gcc-libs' 'gtk3' 'libxxf86vm' 'libxtst' 'gdk-pixbuf2' 'cairo' 'at-spi2-core' 'libxext' 'java-runtime' 'freetype2' \
    'libxrender' 'lib32-glibc')
source=("${pkgname%-bin}-${pkgver}.deb::http://qdl.ziipoo.cn/soft/linuxZiipoo${pkgver}v1.deb"
    "LICENSE::${url}/buy/")
sha256sums=('67b459bff7094396e4ccd9e63748833976183d9479ab9803cea291c31ae990d8'
            '1dffba4ef854522d7c9c703c60229addc3b3768cb9dd410a2f17b3f988ad4fcf')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}" --gname root --uname root
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    mv "${pkgdir}/usr/share/${pkgname%-bin}" "${pkgdir}/opt/"
    sed 's|/usr/share/ziipoo/ziipoo.sh|/opt/ziipoo/ziipoo.sh|g;s|/usr/share/ziipoo/ic_launcher.png|ziipoo|g' \
        -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    sed 's|/usr/share/ziipoo|/opt/ziipoo|g' -i "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.sh"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/ic_launcher.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    find "${pkgdir}" -type d -exec chmod 755 {} \;
    find "${pkgdir}" -type f -exec chmod 644 {} \;
    chmod 755 "${pkgdir}/opt/${pkgname%-bin}/Ziipoo" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.sh"
    rm -rf "${pkgdir}/usr/share/applications/${pkgname%-bin}.ico"
}