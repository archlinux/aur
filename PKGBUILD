# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=ziipoo
pkgname="${_pkgname}-bin"
pkgver=2.2.5.0
pkgrel=1
pkgdesc="Makes music more reliable!壹谱,让音乐更靠谱!"
arch=('x86_64')
url="https://www.ziipoo.cn"
license=('custom')
options=()
providers=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('qt5-base' 'glibc' 'libglvnd' 'fontconfig' 'glib2' 'pango' 'libx11' 'alsa-lib' 'gtk2' 'zlib' 'lib32-gcc-libs' 'sh' \
    'libxi' 'gcc-libs' 'gtk3' 'libxxf86vm' 'libxtst' 'gdk-pixbuf2' 'cairo' 'at-spi2-core' 'libxext' 'hicolor-icon-theme' \
    'freetype2' 'libxrender' 'lib32-glibc' 'java-runtime')
source=("${_pkgname}-${pkgver}.deb::http://qdl.ziipoo.cn/soft/linuxZiipoo2550v1.deb"
    "LICENSE::${url}/buy/")
sha256sums=('07c718748f3e172398524d408eb80be53ada507fbe2e9b1473e942bf80317835'
            'a9d9b19991723ee328d78c95df1ef13563f0b6557e3e57ed76c7768a96b2dfee')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}" --gname root --uname root
    install -Dm755 -d "${pkgdir}/opt/${_pkgname}"
    mv "${pkgdir}/usr/share/${_pkgname}" "${pkgdir}/opt/"
    sed 's/\/usr\/share\/ziipoo\/ziipoo.sh/\/opt\/ziipoo\/ziipoo.sh/g;s/\/usr\/share\/ziipoo\/ic_launcher.png/ziipoo/g;' \
        -i "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    sed 's/\/usr\/share\/ziipoo/\/opt\/ziipoo/g' -i "${pkgdir}/opt/${_pkgname}/${_pkgname}.sh"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgdir}/opt/${_pkgname}/ic_launcher.png" -t "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    find "${pkgdir}" -type d -exec chmod 755 {} \;
    find "${pkgdir}" -type f -exec chmod 644 {} \;
    chmod 755 "${pkgdir}/opt/${_pkgname}/Ziipoo" "${pkgdir}/opt/${_pkgname}/${_pkgname}.sh"
}