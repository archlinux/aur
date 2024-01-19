# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ziipoo-bin
_pkgname=Ziipoo
pkgver=2603
pkgrel=3
pkgdesc="Makes music more reliable!壹谱,让音乐更靠谱!"
arch=('x86_64')
url="https://www.ziipoo.cn"
license=('LicenseRef-custom')
providers=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip')
depends=(
    'qt5-base'
    'libglvnd'
    'fontconfig'
    'pango'
    'libx11'
    'alsa-lib'
    'gtk2'
    'lib32-gcc-libs'
    'ffmpeg4.4'
    'libxi'
    'gtk3'
    'libxxf86vm'
    'libxtst'
    'gdk-pixbuf2'
    'cairo'
    'at-spi2-core'
    'libxext'
    'java-runtime'
    'freetype2'
    'libxrender'
    'lib32-glibc'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/zpocore/download.php?os=linux_deb"
    "LICENSE-${pkgver}.html::${url}/buy/"
    "${pkgname%-bin}.sh"
)
sha256sums=('e11d8dd01a19d048fbf93d39fdb9831ff68149db92872ca27cf1b75150bc68bf'
            '1853f4c818a223e29d3a7031c42b9f3fedca5bb80586714bed913b9a5f5109ec'
            '58a1c8e5f9d2226dd890cf765bcec263cbb47a3de464b8490e3b5b7c9c7636cb')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|usr/share|opt/${pkgname%-bin}|g" -i "${srcdir}/usr/share/${pkgname%-bin}/${pkgname%-bin}.sh"
    sed "s|/usr/share/${pkgname%-bin}/${pkgname%-bin}.sh|${pkgname%-bin}|g;s|/usr/share/${pkgname%-bin}/ic_launcher.png|${pkgname%-bin}|g;s|Audio|AudioVideo|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt"
    cp -r "${srcdir}/usr/share/${pkgname%-bin}" "${pkgdir}/opt"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
    install -Dm644 "${srcdir}/usr/share/${pkgname%-bin}/ic_launcher.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}