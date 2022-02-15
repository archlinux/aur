# Maintainer: Jove Yu <yushijun110@126.com>
pkgname=com.tencent.weixin
pkgver=2.1.2
pkgrel=1
pkgdesc="微信官方原生桌面版 WeChat desktop"
arch=('x86_64')
url="http://pc.weixin.qq.com/"
license=('ISC')
options=('!strip' 'emptydirs')
provides=('wechat')
conflicts=('wechat-uos')
depends=(
    'gtk3' 'nss' 'libxss' 'libnotify' 'bubblewrap' 'lsb-release'
)
source=(
    "https://home-store-packages.uniontech.com/appstore/pool/appstore/c/com.tencent.weixin/${pkgname}_${pkgver}_amd64.deb"
    "license.tar.gz"
    "wechat.sh"
)
md5sums=('b749702c5eafa38b8aaae30a832e678b'
         '42259e3cd8efb2dc01c5a4fca68d4c9f'
         '06b2e9c2bfe41e064478946e75d45296')


package() {
    tar -xf data.tar.xz -C ${pkgdir}
    mv ${pkgdir}/usr/lib/license/{libuosdevicea1.so,libuosdevicea.so}

    sed -i 's/StartupWMClass=微信/StartupWMClass=weixin/' ${pkgdir}/usr/share/applications/weixin.desktop
    sed -i 's_Exec=/opt/apps/com.tencent.weixin/files/weixin/weixin_Exec=/opt/apps/com.tencent.weixin/files/weixin/weixin.sh_' ${pkgdir}/usr/share/applications/weixin.desktop

    cp -r license ${pkgdir}/opt/apps/com.tencent.weixin/
    install -m755 wechat.sh ${pkgdir}/opt/apps/com.tencent.weixin/files/weixin/weixin.sh

    install -d ${pkgdir}/var/uos
    install -d ${pkgdir}/var/lib/uos-license
}
