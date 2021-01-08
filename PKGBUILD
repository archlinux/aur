# Maintainer: Sebastian Gsänger <sebastian_gsaenger [at] web.de>
pkgname=hexdd-data-gog
pkgver=1.1.42970
pkgrel=1
pkgdesc="Hexen: Deathkings of the Dark Citadel data via GOG.com"
arch=('any')
provides=('hexdd-data')
makedepends=('innoextract' 'lgogdownloader')
license=('Proprietary')
url='https://www.gog.com/game/hexen_deathkings_of_the_dark_citadel'
DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
GAMENAME=hexen_deathkings_of_the_dark_citadel
source=("setup_${GAMENAME}_${pkgver%.*}_(${pkgver#*.*.}).exe::gogdownloader://${GAMENAME}/en1installer0")
sha512sums=('5176a94127bff2d46d3c025049d5f53b59dd0fd0f59eba19e4a82e50e6f98c45a560551a264747711534899df60d948a4161a2f34ecf9626c6b9627d33abcf5f')

prepare() {
    cd ${srcdir}
    innoextract --include HEXDD.WAD "setup_${GAMENAME}_${pkgver%.*}_(${pkgver#*.*.}).exe"
}

package() {
    cd ${srcdir}

    # Move required files to pkgdir
    install -D -m 644 $srcdir/HEXDD.WAD $pkgdir/usr/share/doom/HEXDD.WAD
}

