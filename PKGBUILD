# Maintainer: Sebastian Gsänger <sebastian_gsaenger [at] web.de>
pkgname=hexen2-data-gog
pkgver=1.11.43447
pkgrel=1
pkgdesc="Hexen II data via GOG.com"
arch=('any')
provides=('hexen2-data')
makedepends=('innoextract' 'lgogdownloader')
license=('Proprietary')
url='https://www.gog.com/game/hexen_ii'
DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
GAMENAME=hexen_ii
source=("setup_${GAMENAME}_${pkgver%.*}_(${pkgver#*.*.}).exe::gogdownloader://${GAMENAME}/en1installer0")
sha512sums=('1dddc5869216db9ac1d4a380fae322b229bac0fd98672326b9f29c8494e073eafda33575cd0cc386e47aef4208446b98eae0755ad05b0f4e80764050debfb410')

prepare() {
    cd ${srcdir}
    innoextract -I data1/pak0.pak -I data1/pak1.pak "setup_${GAMENAME}_${pkgver%.*}_(${pkgver#*.*.}).exe"
}

package() {
    cd ${srcdir}

    # Move required files to pkgdir
    install -D -m 644 $srcdir/data1/pak0.pak $pkgdir/opt/hexen2/data1/pak0.pak
    install -D -m 644 $srcdir/data1/pak1.pak $pkgdir/opt/hexen2/data1/pak1.pak
}
