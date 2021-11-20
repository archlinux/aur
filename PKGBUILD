# Maintainer: Sukanka <su975853527 [AT] gmail.com>

pkgname=wind-bin
_pkgname=wind
pkgver=21.5.2.2
pkgrel=1
pkgdesc="Wind financial terminal, 万得金融终端"
arch=("x86_64")
url="http://www.wind.com.cn"
license=("unknown")
depends=('libidn11')
provides=("$_pkgname")
install=wind-bin.install
source=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/com.wind.wft/com.wind.wft_${pkgver}_amd64.deb")


sha512sums=('cd062e107dd6703a9024cb66a3c199c9b5f481f8425c5c0b63f30d9499cf1155badfd0cb00472e4b3ffdd9095ebc34961edbbf28245521f329d441614e2ded8b')

prepare(){
    cd ${srcdir}
    tar -xvf data.tar.xz -C "${srcdir}"

}
package(){
    cd $srcdir
    mkdir -p $pkgdir/opt
    mv usr $pkgdir/
    mv opt/apps/com.wind.wft/files   ${pkgdir}/opt/wind
    mv opt/apps/com.wind.wft/entries/* ${pkgdir}/usr/share
    
    sed -i "3,4c Exec=wind \nIcon=com.wind.wft" \
    $pkgdir/usr/share/applications/com.wind.wft.desktop
    
    cd ${pkgdir}/opt/wind
    
    echo '''#!/bin/bash
export LD_LIBRARY_PATH=/opt/wind/lib:/opt/wind/lib/3rd:/opt/wind/wbrowser:$LD_LIBRARY_PATH
cd /opt/wind/bin
./wmain

''' >"$pkgdir"/opt/wind/wind
    
    chmod a+x $pkgdir/opt/wind/wind
    mkdir -p $pkgdir/usr/bin
    ln -s /opt/wind/wind $pkgdir/usr/bin/wind
    
}
 
