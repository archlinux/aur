# $Id: PKGBUILD 184754 2016-08-01 15:30:30Z felixonmars $
# Maintainer: RemiliaForever <remilia AT koumakan DOT cc>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Christoph Drexler <chrdr at gmx dot at>
# Contributor: Jelle van der Waa <jellevdwaa@gmail.com>

pkgname=xmind
pkgver=3.7.4
_filename=$pkgname-8-update4-linux
pkgrel=1
pkgdesc="Brainstorming and Mind Mapping Software"
arch=('i686' 'x86_64')
url="http://www.xmind.net"
license=('EPL' 'LGPL')
depends=('gtk3' 'java-runtime=8')
optdepends=('lame: needed for the feature audio notes')
source=("http://www.xmind.net/xmind/downloads/${_filename}.zip"
"XMind.ini"
"XMind"
"XMind.desktop"
"XMind.png")
sha512sums=('adee77c9a3e262a9bcbcb528bd983beec66550221e5dc1ac4c2a2d36fcbafb0250af9305df5ce2584f6a61a77e44783d2f89c9dc25d8a5e1a4692a71374b30e5'
'SKIP'
'SKIP'
'SKIP'
'SKIP')

package() {
    mkdir -p ${pkgdir}/usr/share/${pkgname}
    cp -r ${srcdir}/configuration   ${pkgdir}/usr/share/${pkgname}/
    cp -r ${srcdir}/features        ${pkgdir}/usr/share/${pkgname}/
    cp -r ${srcdir}/plugins         ${pkgdir}/usr/share/${pkgname}/
    cp ${srcdir}/*.html              ${pkgdir}/usr/share/${pkgname}/
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
    if [[ "$CARCH" == "i686" ]]; then
        sed -i "s/CARCH/x86/g" ${pkgdir}/usr/share/${pkgname}/XMind/XMind.ini
    else
        sed -i "s/CARCH/x86_64/g" ${pkgdir}/usr/share/${pkgname}/XMind/XMind.ini
    fi
    mkdir -p ${pkgdir}/usr/bin
    cp ${srcdir}/XMind ${pkgdir}/usr/bin/
}
