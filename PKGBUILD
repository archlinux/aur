# Maintainer: Sebastian Gsänger <sebastian_gsaenger [at] web.de>
pkgname=heretic-data-gog
pkgver=1.3.42801
pkgrel=1
pkgdesc="Heretic: Shadow of the Serpent Riders data via GOG.com"
arch=('any')
provides=('heretic-data')
makedepends=('innoextract' 'lgogdownloader')
license=('Proprietary')
url='https://www.gog.com/game/heretic_shadow_of_the_serpent_riders'
DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
source=("setup_heretic_shadow_of_the_serpent_riders_${pkgver%.*}_(${pkgver#*.*.}).exe::gogdownloader://heretic_shadow_of_the_serpent_riders/en1installer0")
sha512sums=('2196554a931bea7e3710976d5d249697f350730fdf57c5caf67665b7c7384eba0a5df722220cd2425d55ebc5a1c58c51283e826bb1e3dd91abae5e956e08cbc1')

prepare() {
    cd ${srcdir}
    innoextract --include HERETIC.WAD "setup_heretic_shadow_of_the_serpent_riders_${pkgver%.*}_(${pkgver#*.*.}).exe"
}

package() {
    cd ${srcdir}

    # Move required files to pkgdir
    install -D -m 644 $srcdir/HERETIC.WAD $pkgdir/usr/share/doom/HERETIC.WAD
}

