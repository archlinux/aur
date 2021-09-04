# Maintainer: John-Michael Mulesa <jmulesa at gmail dot com>
# Contributor: kyndair <kyndair at gmail dot com>

pkgname=quake3-data-gog
_pkgname=quake3
pkgver=1
_pkgver=2.0.0.2
pkgrel=2
pkgdesc="Quake 3 data via GOG"
arch=('any')
url="https://www.gog.com/game/quake_iii_gold"
license=('custom')
makedepends=('innoextract' 'icoutils')
provides=('quake3-data')
conflicts=('quake3-data-steam' 'quake3-ta-data-steam')
source=("setup_${_pkgname}_${_pkgver}.exe::gogdownloader://quake_iii_arena_and_team_arena/en1installer1")
sha256sums=('f5471b4b29ea9a10cf5d1a8af2bedeedd4a8cfe1c60b1d52878f80a13bf4d5d6')

# If you want to use lgogdownloader add the following to /etc/makepkg.conf
# DLAGENTS+=('goggogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
DLAGENTS+=("gogdownloader::/usr/bin/echo Could not find gog installer file (%u). Manually download it to \"$(pwd)\", or set up a gogdownloader:// DLAGENT in /etc/makepkg.conf. See PKGBUILD for example.")

prepare() {
    innoextract -s "setup_${_pkgname}_${_pkgver}.exe"
    icotool -x -o . app/goggame-*.ico
}

package() {
    # install game icon
    install -Dm644 "${srcdir}/goggame-1441704920_7_256x256x32.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}-gog.png"

    # install data packs
    install -D -m 644 $srcdir/app/baseq3/pak0.pk3 $pkgdir/opt/${_pkgname}/baseq3/pak0.pk3
    install -D -m 644 $srcdir/app/missionpack/pak0.pk3 $pkgdir/opt/${_pkgname}/missionpack/pak0.pk3
}
