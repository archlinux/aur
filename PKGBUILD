# Maintainer: sukanka <su975853527 at gmail dot com>

_lang=en
pkgname=ting-${_lang}
pkgver=9.3.2
pkgrel=1
_llang=English
pkgdesc="Daily ${_llang} Listening software from eusoft"
arch=('x86_64')
url="https://www.eudic.net/v4/${_lang}/app/ting"
license=('unknown')
depends=('electron7')
source=("${pkgname}-${pkgver}.deb::https://static.frdic.com/pkg/ting_${_lang}/ting_${_lang}.deb")
sha512sums=('b620d47deffabd2c648d8b5730cc786efc20a95894138f2695c84c227e073ab9c6516bbf7a299558a32380d5097490c0260c77e94a154be4c36bdb84342b3a1e')

prepare() {
    cd $srcdir
    mkdir -p build
    tar -xvf data.tar.xz  -C build/
    cd build
    dir_name=$(ls opt/)
    mv opt/${dir_name}/resources/app.asar ${pkgname}.asar 
}

package() {
    cd $srcdir/build
    
    mv usr/ ${pkgdir}/usr
    mkdir -p ${pkgdir}/usr/share/eusoft-${pkgname}
    mv  ${pkgname}.asar ${pkgdir}/usr/share/eusoft-${pkgname}/${pkgname}.asar
    sed -i "3c Exec=${pkgname} %U" ${pkgdir}/usr/share/applications/ting_${_lang}.desktop
    
    # link executable
    mkdir -p ${pkgdir}/usr/bin/
    echo """#!/usr/bin/bash
electron7 /usr/share/eusoft-${pkgname}/${pkgname}.asar
"""> ${pkgdir}/usr/bin/${pkgname}
    chmod a+x ${pkgdir}/usr/bin/${pkgname}

}
# vim: ts=2 sw=2 et:
