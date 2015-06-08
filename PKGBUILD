# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: caemir <benjamin@colard.info>
# Contributor: Eichi <mail@der-eichi.de>
# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=josm-latest
pkgver=8433
pkgrel=1
pkgdesc="Nightly build of an editor for OpenStreetMap written in Java."
arch=('any')
url="http://josm.openstreetmap.de/"
license=('GPL')
depends=('java-runtime')
makedepends=('unzip')
provides=('josm')
conflicts=('josm')
backup=('etc/conf.d/josm')
source=('http://josm.openstreetmap.de/josm-latest.jar'
        'josm.1.man::http://josm.openstreetmap.de/browser/josm/trunk/linux/latest/usr/share/man/man1/josm-latest.1?format=raw'
        'josm.desktop'
        'josm.sh'
        'josm.conf.d')
md5sums=('SKIP'
         'SKIP'
         '0068111faa29d1026e7808ba320e8a3c'
         '97fe42c35e8a90fef9621de2ce027052'
         'a0c7d3add20a2ed0f673fb9cfacab776')
noextract=('josm-latest.jar')

pkgver() {
    unzip -p josm-latest.jar REVISION | sed -n 's/Revision: \([0-9]*\)/\1/p'
}

prepare() {
    unzip -p josm-latest.jar images/logo.png > logo.png
}

package() {
    # application
    install -Dm644 josm-latest.jar "$pkgdir/usr/share/java/josm/josm.jar"
    install -Dm755 josm.sh "$pkgdir/usr/bin/josm"

    # configuration
    install -Dm644 josm.conf.d "$pkgdir/etc/conf.d/josm"

    # desktop integration
    install -Dm644 josm.desktop "$pkgdir/usr/share/applications/josm.desktop"
    install -Dm644 logo.png "$pkgdir/usr/share/pixmaps/josm.png"

    # man page
    install -Dm644 josm.1.man "$pkgdir/usr/share/man/man1/josm.1"
}
