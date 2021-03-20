# Maintainer: zhullyb <zhullyb [at] outlook dot com>

pkgname=com.yunkanpan.numnode
pkgver=1.2.2.3
pkgrel=1
pkgdesc="The Drive to Develop"
arch=("x86_64")
install=
url="https://www.yunkanpan.com/"
license=("custom")
depends=()
options=(!strip)
provides=('yunkanpan')
source=("https://od.zhullyb.workers.dev/?file=/Binary/com.yunkanpan.numnode_1.2.2.3_amd64.deb"
        "start.sh")
md5sums=("995739059c8b8d4ef8cea965e30b8b1b"
         "f76d31c6f2262b16c9601344d086be22")

prepare(){
    cd ${srcdir}
    tar -Jxvf data.tar.xz -C "${srcdir}"

}

package(){
    cd ${srcdir}
    
    mkdir -p ${pkgdir}/opt/yunkanpan
    mv opt/apps/${pkgname}/files/* ${pkgdir}/opt/yunkanpan/

    mkdir -p ${pkgdir}/usr/share/
    mv opt/apps/${pkgname}/entries/*  ${pkgdir}/usr/share/
    mv ${pkgdir}/usr/share/applications/com.yunkanpan.deepin.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    
    sed -i '4c Exec=yunkanpan %U' ${pkgdir}/usr/share/applications/${pkgname}.desktop
    mv ${srcdir}/start.sh ${pkgdir}/opt/yunkanpan/
    chmod a+x ${pkgdir}/opt/yunkanpan/start.sh
    mkdir -p ${pkgdir}/usr/bin
    ln -s /opt/yunkanpan/start.sh ${pkgdir}/usr/bin/yunkanpan
}
 
