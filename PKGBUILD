# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=geekeditor-bin
_pkgname=geekeditor
_originname=GeekEditor
pkgver=1.4.9
pkgrel=1
pkgdesc="Immersive efficiency writing editor.极客编辑器是一款所见即所得(WYSIWYG)富文本沉浸式写作排版编辑器,它注重高效创作,可多开文档编辑,同时支持Markdown语法输入及一键排版"
arch=('x86_64')
url="https://github.com/geekeditor/geekeditor-releases"
license=('GPL3')
conflicts=()
depends=(
    'alsa-lib'
    'nodejs-lts-fermium'
    'gtk3'
    'at-spi2-core'
    'nss'
)
options=()
source=(
  "${_pkgname}_${pkgver}_amd64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
)
sha512sums=('feb9e1602d0cb5035fae8df9824d3a881aadbb5fae35c9009bd06e2de97a51ec7f4a3bbe4f303ab7bc9d5f2af83aec6da381f4839d36cf3d7fe77d4436f6363d')
 
prepare() {
    bsdtar -xvf data.tar.xz
    mv "${srcdir}/opt/${_originname}" "${srcdir}/opt/${pkgname}"
    mv "${srcdir}/opt/${pkgname}/${_originname}" "${srcdir}/opt/${pkgname}/${pkgname}"
    mv "${srcdir}/usr/share/applications/${_originname}.desktop" "${srcdir}/usr/share/applications/${pkgname}.desktop"
    sed 's/Exec=/#Exec=/g;s/Icon=/#Icon=/g;s/Categories=/#Categories=/g' -i "${srcdir}/usr/share/applications/${pkgname}.desktop"
    echo "Exec=/opt/geekeditor-bin/geekeditor-bin %U" >> "${srcdir}/usr/share/applications/${pkgname}.desktop"
    echo "Icon=geekeditor-bin" >> "${srcdir}/usr/share/applications/${pkgname}.desktop"
    echo "Categories=GTK;Utility;TextEditor;" >> "${srcdir}/usr/share/applications/${pkgname}.desktop"
    for i in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024; do
        mv "${srcdir}/usr/share/icons/hicolor/${i}/apps/${_originname}.png" \
            "${srcdir}/usr/share/icons/hicolor/${i}/apps/${pkgname}.png"
    done
}
 
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
}
