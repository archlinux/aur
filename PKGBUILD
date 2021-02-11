# Maintainer: sukanka <su975853527 at gmail dot com>

_lang=de
pkgname=ting-${_lang}
pkgver=9.3.2
pkgrel=1
_llang=German
pkgdesc="Daily ${_llang} Listening software from eusoft"
arch=('x86_64')
url="https://www.eudic.net/v4/${_lang}/app/ting"
license=('unknown')
makedepends=('asar')
depends=('electron7')
options=('!strip')
source=("${pkgname}-${pkgver}.deb::https://static.frdic.com/pkg/ting_${_lang}/ting_${_lang}.deb")
sha512sums=('603e91910cd1640347806245a362f09e620edb2e0e770c6bf1186b4c1d6f4ff9c3886a13d4511065bb3b0369bf5c1fe8c3ec5d400e5f67ed78a2f628aaed1a0f')

prepare() {
    cd $srcdir
    mkdir -p build
    tar -xvf data.tar.xz  -C build/
    cd build
    dir_name=$(ls opt/)
    asar extract opt/${dir_name}/resources/app.asar ${pkgname}
}

package() {
    cd $srcdir/build
    
    mv usr/ ${pkgdir}/usr
    mkdir -p ${pkgdir}/usr/share/eusoft/${pkgname}
    mv  ${pkgname} ${pkgdir}/usr/share/eusoft/
    sed -i "3c Exec=${pkgname} %U" ${pkgdir}/usr/share/applications/ting_${_lang}.desktop
    
    # link executable
    mkdir -p ${pkgdir}/usr/bin/
    echo """#!/usr/bin/bash
/usr/lib/electron7/electron /usr/share/eusoft/${pkgname}
"""> ${pkgdir}/usr/bin/${pkgname}
    chmod a+x ${pkgdir}/usr/bin/${pkgname}

}
# vim: ts=2 sw=2 et:
