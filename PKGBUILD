# Contributor: Raniz <raniz *AT* gmx *DOT* net>
# Maintainer: Parth Nobel <pnob99 *AT* gmail *DOT* com>

pkgname=triplea
pkgver=1.9.0.0.7594
pkgrel=1
pkgdesc='An online multiplayer turn based strategy game and board game engine.'
arch=('any')
url="http://www.triplea-game.org/"
license=('GPL')
install=${pkgname}.install
depends=('gtk-update-icon-cache' 'java-runtime')
source=( "https://github.com/triplea-game/triplea/releases/download/${pkgver}/triplea-${pkgver}-all_platforms.zip"
         "https://github.com/chrisfair/tripleapatches/archive/${pkgver}.tar.gz"
         "triplea")
sha256sums=('5e419c7bb6a7cfdf375afed292d769694b4be3d910e1734c0533478e244870d2' 
            'fd7ed202cc25488b3d526d928035224f9de9e32fe6650cb2974b575f65cca6ea'
            '2774c5d96117330cd5edaf7f4aae0f9a6ffbe757b2d9a8ae4bbc5b0dfde9274f')


package() {
    install -d "${pkgdir}/usr/share/${pkgname}"
    cd ${srcdir}/tripleapatches-${pkgver}
    cp triplea.patch ${srcdir}
    cd ${srcdir}
    patch -Np4 -i ${srcdir}/triplea.patch 
    rm ${srcdir}/${pkgver}.tar.gz
    rm -rf ${srcdir}/tripleapatches-${pkgver}
    rm ${srcdir}/triplea.patch
    rm ${srcdir}/triplea-${pkgver}-all_platforms.zip
    rm ${srcdir}/uninstall
    rm ${srcdir}/${pkgname}
    cp ../${pkgname} .
    chmod +x ${srcdir}/${pkgname}
    chmod +x ${srcdir}/TripleA
    cp -rfR ${srcdir} ${pkgdir}/usr/share
    rm -rf ${pkgdir}/usr/share/${pkgname}
    mv ${pkgdir}/usr/share/src ${pkgdir}/usr/share/${pkgname} 
    install -D -m 0755 ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
