# Maintainer: Jove Yu <yushijun110@126.com>
pkgname=com.tencent.weixin
pkgver=2.1.1
pkgrel=2
pkgdesc="微信官方原生桌面版"
arch=('x86_64')
url="http://pc.weixin.qq.com/"
license=('ISC')
options=('!strip')
provides=('wechat' 'weixin')
depends=(
    'gtk3' 'nss' 'libxss' 'libnotify' 'bubblewrap'
)
source=(
    "https://home-store-packages.uniontech.com/appstore/pool/appstore/c/com.tencent.weixin/${pkgname}_${pkgver}_amd64.deb"
    "license.tar.gz"
    "wechat.sh"
)
md5sums=(
    'd9fb99271b4d2279a9c0eaefee9b59b2'
    'b457602e322cc39a361c1cd8dcfcd295'
    '49c5e8d07aca206b67914e99ef5f6419'
)

package() {
    tar -xf data.tar.xz -C ${pkgdir}
    sed -i 's/StartupWMClass=微信/StartupWMClass=weixin/' ${pkgdir}/usr/share/applications/weixin.desktop
    sed -i 's_Exec=/opt/apps/com.tencent.weixin/files/weixin/weixin_Exec=/opt/apps/com.tencent.weixin/files/weixin/weixin.sh_' ${pkgdir}/usr/share/applications/weixin.desktop

    install -m755 wechat.sh ${pkgdir}/opt/apps/com.tencent.weixin/files/weixin/weixin.sh
    install -m755 license/libuosdevicea.so ${pkgdir}/usr/lib/license/libuosdevicea.so
    install -Dm644 license/license.json ${pkgdir}/var/lib/uos-license/.license.json
    install -Dm644 license/license.key ${pkgdir}/var/uos/.license.key
    install -m644 license/os-release ${pkgdir}/opt/apps/com.tencent.weixin/os-release
    install -m644 license/lsb-release ${pkgdir}/opt/apps/com.tencent.weixin/lsb-release
}
