# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=listera-novelreader
pkgver=1.2.1
pkgrel=1
pkgdesc="A txt Chinese novel reader, developed based on Qt5 and Dtk5.一个 txt 中文小说阅读器，基于 Qt5 和 Dtk5 开发。"
arch=('x86_64')
url="https://www.listera.top/tag/novelreader"
_giteeurl="https://gitee.com/lidanger/listera-novelreader"
license=('GPL3')
conflicts=()
depends=(
    'qt5-base'
    'hicolor-icon-theme'
    'dtkcore'
    'dtkgui'
    'dtkwidget'
)
options=()
source=(
  "${pkgname}-${pkgver}.deb::${_giteeurl}/releases/download/v${pkgver}/${pkgname}_${pkgver}-3_amd64.deb"
  "LICENSE::${_giteeurl}/raw/master/LICENSE"
)
sha512sums=('d24fbb41217cbaeba1d966146784d934937393413f380e11efe816f638400b09912fafdebafd87497acd0380941068538d88c894a1511607bbbed7fbe995e892'
            '4937848b94f5b50ea16c51f9e98fdcd3953aca63d63ca3bb05d8a62c107e382b71c496838d130ae504a52032398630b957acaea6c48032081a6366d27cba5ea9')
  
prepare() {
    bsdtar -xf data.tar.gz
    mkdir -p "${srcdir}/opt/${pkgname}"
    mv "${srcdir}/usr/bin/${pkgname}" "${srcdir}/opt/${pkgname}"
    rm -rf "${srcdir}/usr/bin"
    sed 's/\/usr\/bin/\/opt\/listera-novelreader/g;s/Categories=Viewer;Text;Reader;Novel;/Categories=Utility;/g' \
        -i "${srcdir}/usr/share/applications/${pkgname}.desktop"
}
  
package() {
    cp --parents -a {opt,usr} "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
