# Maintainer: sukanka <su975853527 at gmail dot com>

pkgname=iauto
pkgver=3.1.2
pkgrel=1
pkgdesc="Flowchart diagrams drawer"
arch=('x86_64')
url="http://www.iautodraw.com"
license=('unknown')
depends=(electron3)
source=("http://www.iautodraw.com/static/version/Iauto_3.1.2(Linux).deb")
sha512sums=('561ec73b03fc0fe22e69e7ce9a440f3fa260d81f5f104923483761c2581796df2c5bc9245af371b5886aea5cc02b5479b6a22f5db2300fb882e1be26db5dfa43')

prepare() {
    cd $srcdir
    tar -xvf data.tar.xz -C "${srcdir}"
}

package() {
    cd $srcdir/
    mv usr ${pkgdir}/
    
    mkdir -p ${pkgdir}/usr/share/${pkgname}
    mv $srcdir/opt/${pkgname}/resources/app.asar ${pkgdir}/usr/share/${pkgname}/${pkgname}.asar
    
    cd ${pkgdir}/usr/share/applications
    sed -i "4c Exec=${pkgname} %U" ${pkgname}.desktop
    
    
    
    
    # link executable
    mkdir -p ${pkgdir}/usr/bin/
    echo """#!/usr/bin/bash
electron3 /usr/share/${pkgname}/${pkgname}.asar
"""> ${pkgdir}/usr/bin/${pkgname}
    chmod a+x ${pkgdir}/usr/bin/${pkgname}

}
# vim: ts=2 sw=2 et:
