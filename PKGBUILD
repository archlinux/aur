# Contributor: Raniz <raniz *AT* gmx *DOT* net>
# Maintainer: Parth Nobel <pnob99 *AT* gmail *DOT* com>

pkgname=triplea
pkgver=1.8.0.5
pkgrel=1
pkgdesc='An online multiplayer turn based strategy game and board game engine.'
arch=('any')
url="http://triplea.sf.net"
license=('GPL')
install=${pkgname}.install
depends=('gtk-update-icon-cache' 'java-runtime')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}_${pkgver//./_}_all_platforms.zip" "https://github.com/PTNobel/TripleA/archive/master.zip" "triplea")
sha256sums=('4201612de9970ca19baaf04e45b967ee57993b91ce77e3015a1908d13b46a1b2'
            'c1199447596534f80dbacee93ca10b41a19c3c09224fb5440b19e16902494014'
            '4fdd7ad0c1a802a3142e800dc1f354a246586d8bb75b8c17b6dc948b5cf35f05')

package() {
    install -d "${pkgdir}/usr/share/triplea"
    cd ${srcdir}/${pkgname}_${pkgver//./_}
    cp -R * ${pkgdir}/usr/share/triplea
    cd ${srcdir}/TripleA-master/usr/share/
    cp -R * ${pkgdir}/usr/share
    cd ${srcdir}

    find ${pkgdir}/usr/share/triplea -type d -exec chmod 755 {} \;
    find ${pkgdir}/usr/share/triplea -type f -exec chmod 644 {} \;
    chmod 755 ${pkgdir}/usr/share/triplea/triplea_unix.sh
    cd ${pkgdir}/usr/share/triplea/
    rm triplea_mac_os_x.sh
    rm triplea_windows.bat
    rm run-headless-game-host-windows.bat
    rm MacOS_users_read_this_first.txt
    rm triplea.exe
    rm -Rf docs 
    install -D -m 0755 ${srcdir}/triplea ${pkgdir}/usr/bin/triplea
}

