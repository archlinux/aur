# Maintainer: zhullyb <zhullyb [at] outlook dot com>
# Contributor: Bruce Zhang <zttt183525594@gmail.com>

pkgname=dingtalk-bin
pkgver=1.0.0.203
pkgrel=1
pkgdesc="钉钉"
arch=("x86_64")
url="https://gov.dingtalk.com"
license=("custom")
depends=()
options=()
provides=('com.alibabainc.dingtalk' 'dingtalk')
conflicts=('com.alibabainc.dingtalk')
replaces=('com.alibabainc.dingtalk')
source=("https://dtapp-pub.dingtalk.com/dingtalk-desktop/xc_dingtalk_update/linux_deb/Release/com.alibabainc.dingtalk_${pkgver}_amd64.deb"
        "com.alibabainc.dingtalk.desktop"
        "dingtalk")
md5sums=('24ea8f14c8d5552d0b4aa616a4985155'
         'e1b984a024700a9ef5f77a1018a41f8e'
         '0e255cd61852162548db96e46f1dda00')

prepare(){
    cd ${srcdir}
    tar -Jxvf data.tar.xz -C "${srcdir}"
}

package(){
    cd ${srcdir}

    mkdir -p ${pkgdir}/opt/apps/com.alibabainc.dingtalk/files
    mv opt/apps/com.alibabainc.dingtalk/files/* ${pkgdir}/opt/apps/com.alibabainc.dingtalk/files

    mkdir -p ${pkgdir}/usr/bin
    install -Dm 755 ${srcdir}/dingtalk ${pkgdir}/usr/bin/dingtalk

    install -Dm644 com.alibabainc.dingtalk.desktop -t ${pkgdir}/usr/share/applications/

    rm ${pkgdir}/opt/apps/com.alibabainc.dingtalk/files/*/libm.so.6
}
