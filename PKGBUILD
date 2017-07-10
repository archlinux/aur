# $Id: PKGBUILD 184754 2016-08-01 15:30:30Z felixonmars $
# Maintainer: RemiliaForever <remilia AT koumakan DOT cc>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Christoph Drexler <chrdr at gmx dot at>
# Contributor: Jelle van der Waa <jellevdwaa@gmail.com>

pkgname=xmind
pkgver=3.7.2
_filename=$pkgname-8-update2-linux
pkgrel=1
pkgdesc="Brainstorming and Mind Mapping Software"
arch=('i686' 'x86_64')
url="http://www.xmind.net"
license=('EPL' 'LGPL')
depends=('desktop-file-utils' 'fontconfig' 'libxrender' 'java-runtime' 'shared-mime-info' 'libxext')
optdepends=('lame: needed for the feature audio notes')
source=("http://www.xmind.net/xmind/downloads/${_filename}.zip"
        "XMind.ini"
        "XMind"
        "XMind.desktop"
        "XMind.png")
sha512sums=('e658714a5944e8de62577302c22763e9c55d1f82ce6cbda187ec39801ac7cbd5c34de6e4d7d9735546bcef26795c21c194ff026cebf39b2c9af2663cec98ce58'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
    mkdir -p ${pkgdir}/usr/share/${pkgname}
    cp -r ${srcdir}/configuration   ${pkgdir}/usr/share/${pkgname}/
    cp -r ${srcdir}/features        ${pkgdir}/usr/share/${pkgname}/
    cp -r ${srcdir}/plugins         ${pkgdir}/usr/share/${pkgname}/
    cp ${srcdir}/*.xml              ${pkgdir}/usr/share/${pkgname}/
    cp ${srcdir}/*.txt              ${pkgdir}/usr/share/${pkgname}/
    if [[ "$CARCH" == "i686" ]]; then
        cp -r ${srcdir}/XMind_i386  ${pkgdir}/usr/share/${pkgname}/XMind
    else
        cp -r ${srcdir}/XMind_amd64 ${pkgdir}/usr/share/${pkgname}/XMind
    fi
    mkdir -p ${pkgdir}/usr/share/fonts/${pkgname}
    cp -r ${srcdir}/fonts           ${pkgdir}/usr/share/fonts/${pkgname}/
    mkdir -p ${pkgdir}/usr/share/applications
    cp ${srcdir}/XMind.desktop      ${pkgdir}/usr/share/applications/
    mkdir -p ${pkgdir}/usr/share/pixmaps
    cp ${srcdir}/XMind.png          ${pkgdir}/usr/share/pixmaps/
    # fix configuration
    cp ${srcdir}/XMind.ini ${pkgdir}/usr/share/${pkgname}/XMind/
    mkdir -p ${pkgdir}/usr/bin
    cp ${srcdir}/XMind ${pkgdir}/usr/bin/
}
