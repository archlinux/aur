#Maintainer: sukanka<su975853527 [AT] gmail.com>

pkgname=('mtxx-bin')
_pkgname="mtxx"
pkgver=2.0.0
pkgrel=2
pkgdesc="美图秀秀, An image editing software that is mostly used in Mainland China"
provides=($_pkgname)
url="https://xiuxiu.web.meitu.com/"
arch=('x86_64')
license=('unknown')
provides=("${_pkgname}")
depends=('qt5-webkit' 'hicolor-icon-theme' 'freeimage')
source=("${_pkgname}-${pkgver}.deb::https://professional-store-packages.chinauos.com/appstore/pool/appstore/c/com.meitu.mtxx/com.meitu.mtxx_${pkgver}_amd64.deb"
)
sha512sums=('919ea5975271efd3b2b14ca86eccf32bdd8f3a4cfc5ddc5e983a8d8f718f2ea6d5771ad3abacf834f7620f6cdae708dce62d10de5354fdc6bd58be029223d5ee')

prepare(){
    cd ${srcdir}
    tar -xJvf data.tar.xz -C "${srcdir}"
    cp -pr opt/apps/com.meitu.mtxx ${_pkgname}
}
package(){
    cd ${srcdir}
    mkdir -p ${pkgdir}/usr/lib
    mv ${_pkgname}/entries          ${pkgdir}/usr/share
    mv ${_pkgname}/files/bin        ${pkgdir}/usr/share/${_pkgname}
    mv ${_pkgname}/files/lib/libMT* ${pkgdir}/usr/lib
    
    cd ${pkgdir}/usr/share/applications/
    
    sed -i "6c Exec=${_pkgname} %U" com.meitu.mtxx.desktop
    sed -i "11c Icon=MTXX"          com.meitu.mtxx.desktop
    
    cd ${pkgdir}/usr/share/${_pkgname}
    rm *.sh mosaicpen/*.txt
    
    mkdir ${pkgdir}/usr/bin
    ln -s /usr/share/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin

	 
}

