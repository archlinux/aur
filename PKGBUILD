# Maintainer: Jove Yu <yushijun110@126.com>
# Contribuor: luosoy <249799588@qq.com>
pkgname=com.qq.weixin.deepin
_pkgver=3.4.0.38deepin6
pkgver=${_pkgver//deepin/_}
pkgrel=1
pkgdesc="Deepin Wine WeChat"
arch=('x86_64')
url="http://pc.weixin.qq.com/"
license=('Proprietary')
depends=('deepin-wine6-stable' 'deepin-wine-helper')
makedepends=('tar')
conflicts=('deepin-wine-wechat' 'deepin.com.wechat' 'deepin.com.wechat2')
source=(
    "https://community-store-packages.deepin.com/appstore/pool/appstore/c/${pkgname}/${pkgname}_${_pkgver}_i386.deb"
    "libldap24.tar.gz"
)
md5sums=('e17af39797c2fce0ec8c69fb84f5d41d'
         '9f42504749b5d9936428a83c28d13aad')


package() {
    tar -xf data.tar.xz -C ${pkgdir}
    # install icon and desktop file
    mkdir -p ${pkgdir}/usr/share/
    cp -r ${pkgdir}/opt/apps/${pkgname}/entries/icons/ ${pkgdir}/usr/share/
    cp -r ${pkgdir}/opt/apps/${pkgname}/entries/applications/ ${pkgdir}/usr/share/
    sed -i 's/WeChat.exe/wechat.exe/' ${pkgdir}/usr/share/applications/${pkgname}.desktop
    # fix WeChatWin.dll error
    mv libldap24 ${pkgdir}/opt/apps/${pkgname}/lib
    sed -i '8iexport LD_LIBRARY_PATH=/opt/apps/com.qq.weixin.deepin/lib/' ${pkgdir}/opt/apps/${pkgname}/files/run.sh

}
