# Maintainer: M0Rf30

pkgname=unrealtournament-bonuspack2
pkgver=20000104
pkgrel=3
pkgdesc="Bonuspack 2: The Digital Extremes Pack for Unreal Tournament."
arch=('i686' 'x86_64')
url="http://www.unrealtournament2004.com/utgoty/"
license=('custom')
groups=(unrealtournament unrealtournament-bonuspacks)
depends=(unrealtournament)
makedepends=(umodunpack)
conflicts=(ut1999-bonuspack2)
install=install
source=(https://github.com/XenGi/oldgames/raw/master/ut/utbonuspack2.zip
        install)

package() {
    cd "$srcdir"
    install --mode=644 -D -- CTF-HallOfGiants.unr \
            "$pkgdir/opt/ut/Maps/CTF-HallOfGiants.unr" || return 1
    install --mode=644 -D -- CTF-Orbital.unr \
            "$pkgdir/opt/ut/Maps/CTF-Orbital.unr" || return 1

    # Cannot unpack directly. Umodpack wants to apply some .ini changes.
    umodunpack --base "$pkgdir/opt/ut" --extract "de.int" DE.umod \
            || return 1
    umodunpack --base "$pkgdir/opt/ut" --extract "de.u" DE.umod \
            || return 1
    umodunpack --base "$pkgdir/opt/ut" \
            --extract "demutators-readme.txt" DE.umod || return 1
    umodunpack --base "$pkgdir/opt/ut" --extract "de-logo.bmp" \
            DE.umod || return 1
    chmod -R -- 644 $pkgdir/opt/ut/*/*
}

md5sums=('5cf174dab9f91827da9935231c8d1ea6'
         '4c08119de5a5f1be0baf6e6abf2ef7e0')

