# Maintainer: Sebastian Gsänger <sebastian_gsaenger [at] web.de>
pkgname=hexen-data-gog
pkgver=1.1.42801
pkgrel=1
pkgdesc="Hexen: Beyond Heretic data via GOG.com"
arch=('any')
provides=('hexen-data')
makedepends=('innoextract' 'lgogdownloader')
license=('Proprietary')
url='https://www.gog.com/game/hexen_beyond_heretic'
DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
source=("setup_hexen_beyond_heretic_${pkgver%.*}_(${pkgver#*.*.}).exe::gogdownloader://hexen_beyond_heretic/en1installer0")
sha512sums=('18131a857867d452b41e09dd129656d35de9cf01ad17d5bb17b4baba7875a668d868055cb80b3af330a915059ee6965e058f552c97cddcdac90e474dd579dc2a')

prepare() {
    cd ${srcdir}
    innoextract --include HEXEN.WAD "setup_hexen_beyond_heretic_${pkgver%.*}_(${pkgver#*.*.}).exe"
}

package() {
    cd ${srcdir}

    # Move required files to pkgdir
    install -D -m 644 $srcdir/HEXEN.WAD $pkgdir/usr/share/doom/HEXEN.WAD
}


