# Maintainer: Christopher Fair < christopherpatrickfair@gmail.com>

pkgname=triplea
pkgver=2.7.14900
pkgrel=1
pkgdesc='An online multiplayer turn based strategy game and board game engine.'
arch=('any')
appname="triplea-game-headed"
url="http://www.triplea-game.org/"
license=('GPL')
install=${pkgname}.install
depends=('gtk-update-icon-cache' 'java-runtime')
source=( "https://github.com/triplea-game/triplea/releases/download/${pkgver}/${appname}.zip")
sha256sums=('09f6683ac7468dbbecbb7e8d19d1abdd0fcc63f29b07145ba56268c82c17a760')
package() {
    install -d ${pkgdir}/usr/share/${pkgname}
    install -d ${pkgdir}/usr/bin
    cp -rfpv ${srcdir}/bin ${pkgdir}/usr/share/${pkgname}
    cp -rfpv ${srcdir}/assets ${pkgdir}/usr/share/${pkgname}/bin
    cp -rfpv ${srcdir}/.triplea-root ${pkgdir}/usr/share/${pkgname}
    cp ${srcdir}/.triplea-root ${pkgdir}/usr/share/${pkgname}
    cd ${pkgdir}/usr/bin
    # Replace the last . in version with #
    newVer=$(echo "$pkgver" | sed 's/\([0-9]*\.[0-9]*\)\.\([0-9]*\)/\1+\2/')
    newAppName=${appname}-${newVer}.jar
    printf "#! /usr/bin/bash \n cd /usr/share/${pkgname}/bin \n java -jar ${newAppName}" > triplea 
    chmod +x triplea
}
