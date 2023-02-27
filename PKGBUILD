# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepin-wine-xiguavideo
_pkgname=com.ixigua.xigua-video.spark
_officalname=xiguavideo
pkgver=1.0.4
_deepinver=1.0.4spark0
pkgrel=1
pkgdesc="XiGua Video on Deepin Wine 6"
arch=("x86_64")
url="https://www.ixigua.com/"
license=('unknown')
depends=('deepin-wine6-stable' 'xdg-utils')
optdepends=()
conflicts=()
install="deepin-wine-xiguavideo.install"
source=(
    "${_pkgname}_${_deepinver}_amd64.deb::https://mirrors.sdu.edu.cn/spark-store-repository/store/video/${_pkgname}/${_pkgname}_${_deepinver}_amd64.deb"
    "deepin-wine-xiguavideo.install"
    "run.sh"
    )
sha256sums=('8f30dc77792de6c406a3f5c085fc6cc4a8a2dcda4ac5eeae456dcb4a5cfc6f9b'
            '660a7ebea59ed424362575d5cd2f13d661d27e7be36a2923035a2197e2f573da'
            '12fc697e247ed24a18d567c35867a26c82bf3394e3fcae3346dc2f828b34d287')
prepare() {
    bsdtar -xf data.tar.xz -C "${srcdir}"
    mv "${srcdir}/opt/apps/${_pkgname}" "${srcdir}/opt/apps/${pkgname}"
    rm -rf ${srcdir}/opt/apps/${pkgname}/info
    sed 's/com.ixigua.xigua-video.spark/deepin-wine-xiguavideo/g' -i "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop"
}
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    md5sum "${srcdir}/opt/apps/${pkgname}/files/files.7z" | awk '{ print $1 }' > "${pkgdir}/opt/apps/${pkgname}/files/files.md5sum"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/opt/apps/${pkgname}/entries/icons/hicolor/scalable/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.png"
    install -Dm755 "${srcdir}/run.sh" "${pkgdir}/opt/apps/${pkgname}/files/"
}