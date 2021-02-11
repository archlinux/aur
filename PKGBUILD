# Maintainer: sukanka <su975853527 at gmail dot com>

_lang=fr
pkgname=ting-${_lang}
pkgver=9.2.1
pkgrel=1
_llang=French
pkgdesc="Daily ${_llang} Listening software from eusoft"
arch=('x86_64')
url="https://www.eudic.net/v4/${_lang}/app/ting"
license=('unknown')
makedepends=('asar')
depends=('electron7')
options=('!strip')
source=("${pkgname}-${pkgver}.deb::https://static.frdic.com/pkg/ting_${_lang}/ting_${_lang}.deb")
sha512sums=('3e0ea70c774d780f07e058dc17c84e26cae28f989a1856605c7aa7cc721c9ef8e7d5b9f2205680148bfc4e2f1ede2fa0cf7314d840630c89b343a9741fee92df')

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
