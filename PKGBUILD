# Maintainer: sukanka <su975853527 at gmail dot com>

pkgname=wechat-uos
_pkgname=wechat
pkgver=2.1.1
pkgrel=1
epoch=2
pkgdesc="wechat"
arch=('x86_64')
url="https://weixin.qq.com/"
license=('ISC')
depends=(electron bubblewrap )
source=("${_pkgname}-${pkgver}.deb::http://archive.ubuntukylin.com/ubuntukylin/pool/partner/weixin_${pkgver}_amd64.deb"
"wechat.sh"
)
sha512sums=('8edd4439f1823291fa827b0a48769f618271b66cdd39d6aa5fe41c84e84d04c305b880104aff110ae173178b202294d44321337e89a3d1d6d5086c548f291eca'
            'f2f2f789d1d02c0fd5acbd9a77c1a52c02c2fc8a1a5690d18c673357b80ca684532e3d752594b39ff945b45a9fc9a6733e67395a12e825398f010ec50e05387f')
options=(!strip)

prepare() {
   cd ${srcdir}
    tar -Jxvf data.tar.xz -C "${srcdir}"
}

package(){
    cd $srcdir
    mv etc usr ${pkgdir}
    mv opt/weixin/resources/app ${pkgdir}/usr/lib/wechat
    install -Dm755 wechat.sh ${pkgdir}/usr/bin/wechat
    
    cd ${pkgdir}/usr/share/applications/
    sed -i "4c Exec=wechat %U" weixin.desktop
    echo "Keywords=wechat;weixin;" >> weixin.desktop
    
}
# vim: ts=2 sw=2 et:
