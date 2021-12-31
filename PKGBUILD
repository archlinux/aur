# Maintainer: Jove Yu <yushijun110@126.com>
pkgname=com.tencent.weixin
pkgver=2.1.1
pkgrel=3
pkgdesc="微信官方原生桌面版 WeChat desktop"
arch=('x86_64')
url="http://pc.weixin.qq.com/"
license=('ISC')
options=('!strip' 'emptydirs')
provides=('wechat' 'weixin')
depends=(
    'gtk3' 'nss' 'libxss' 'libnotify' 'bubblewrap'
)
source=(
    "https://home-store-packages.uniontech.com/appstore/pool/appstore/c/com.tencent.weixin/${pkgname}_${pkgver}_amd64.deb"
    "license.tar.gz"
    "wechat.sh"
)
md5sums=('d9fb99271b4d2279a9c0eaefee9b59b2'
         '42259e3cd8efb2dc01c5a4fca68d4c9f'
         '10aa2e700bc73c5b5e53de5b38c6a425')

package() {
    tar -xf data.tar.xz -C ${pkgdir}
    sed -i 's/StartupWMClass=微信/StartupWMClass=weixin/' ${pkgdir}/usr/share/applications/weixin.desktop
    sed -i 's_Exec=/opt/apps/com.tencent.weixin/files/weixin/weixin_Exec=/opt/apps/com.tencent.weixin/files/weixin/weixin.sh_' ${pkgdir}/usr/share/applications/weixin.desktop

    cp -r license ${pkgdir}/opt/apps/com.tencent.weixin/
    install -m755 wechat.sh ${pkgdir}/opt/apps/com.tencent.weixin/files/weixin/weixin.sh

    install -d ${pkgdir}/usr/lib/license
    install -d ${pkgdir}/var/uos
    install -d ${pkgdir}/var/lib/uos-license
}
