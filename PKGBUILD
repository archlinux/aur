# Maintainer: Sukanka <su975853527 [AT] gmail.com>

pkgname=xunlei-bin
pkgver=1.0.0.1
pkgrel=1
pkgdesc="Xun lei download, 迅雷"
arch=("x86_64" "arm64")
url="https://www.xunlei.com/"
license=("unknown")
depends=()
source_x86_64=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/com.xunlei.download/com.xunlei.download_${pkgver}_amd64.deb")
source_arm64=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/com.xunlei.download/com.xunlei.download_${pkgver}_arm64.deb")
sha512sums_x86_64=(
    'e4957652d04188d960a04f969e1d31642ca9b421892de0b69c0623726ff3e9bc0095fff5f4037ad2e23d80becc2e91e6bc9dae5a4ba3121526ac6a8a8dc094c5'
)
sha512sums_arm64=(
    '4e3ef94451c9fdbb1b8c6127108f5598c144801edca8f8347832c40a02858f11c9b04ebfe351ed72052f86016925f9d230cc2f002cc96d5c8b0062e9e7ce9314'
)

prepare(){
    cd ${srcdir}
    tar -zxf data.tar.gz -C "${srcdir}"

}

package(){
    cd ${srcdir}
    mkdir -p ${pkgdir}/opt/xunlei
    mv opt/apps/com.xunlei.download/files/* ${pkgdir}/opt/xunlei
    
    install -D opt/apps/com.xunlei.download/entries/applications/com.xunlei.download.desktop \
        ${pkgdir}/usr/share/applications/com.xunlei.download.desktop
    
    mkdir -p ${pkgdir}/usr/share/
    mv opt/apps/com.xunlei.download/entries/icons  ${pkgdir}/usr/share/icons
    
    sed -i '4c Exec=xunlei %U' ${pkgdir}/usr/share/applications/com.xunlei.download.desktop
    sed -i '7c Categories=Network' ${pkgdir}/usr/share/applications/com.xunlei.download.desktop
    
    
    echo '''#!/bin/bash

export LD_LIBRARY_PATH=/opt/xunlei:$LD_LIBRARY_PATH
/opt/xunlei/thunder -start $1
''' > ${pkgdir}/opt/xunlei/start.sh
    mkdir -p ${pkgdir}/usr/bin
    ln -s /opt/xunlei/start.sh ${pkgdir}/usr/bin/xunlei
    
}
