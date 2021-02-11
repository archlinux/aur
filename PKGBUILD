# Maintainer: sukanka <su975853527 at gmail dot com>

_lang=en
pkgname=ting-${_lang}
pkgver=9.3.1
pkgrel=1
_llang=English
pkgdesc="Daily ${_llang} Listening software from eusoft"
arch=('x86_64')
url="https://www.eudic.net/v4/${_lang}/app/ting"
license=('unknown')
makedepends=('asar')
depends=('electron7')
options=('!strip')
source=("${pkgname}-${pkgver}.deb::https://static.frdic.com/pkg/ting_${_lang}/ting_${_lang}.deb")
sha512sums=('324aef42a1f5600919c0c8cc92dd3f437445b4da78c6a2fac28d731a7ddaff648b4874c0cf20223b8c6008bbf159a6ec9c278a8bb442d8faadb6a0a6f3ac68b8')

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
