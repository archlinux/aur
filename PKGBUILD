# Maintainer: John-Michael Mulesa <jmulesa at gmail dot com>
# Contributor: kyndair <kyndair at gmail dot com>

pkgname=daikatana-data-gog
_pkgname=daikatana
pkgver=1
_pkgver="1.0_(22142)"
pkgrel=1
pkgdesc="Daikatana data via GOG"
arch=('any')
url="https://www.gog.com/en/game/daikatana"
license=('custom')
makedepends=('innoextract' 'icoutils')
provides=('daikatana-data')
conflicts=('daikatana-data-steam')
source=("setup_${_pkgname}_${_pkgver}.exe::gogdownloader://${_pkgname}/en1installer0")
sha256sums=('3ba8e369af573a142ea2689d4003f2eb441e9395d484a65f29fcb41ba95e26ec')

# If you want to use lgogdownloader add the following to /etc/makepkg.conf
# DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
DLAGENTS+=("gogdownloader::/usr/bin/echo Could not find gog installer file (%u). Manually download it to \"$(pwd)\", or set up a gogdownloader:// DLAGENT in /etc/makepkg.conf. See PKGBUILD for example.")

prepare() {
    innoextract -s "setup_${_pkgname}_${_pkgver}.exe"
    icotool -x -o . app/goggame-*.ico
}

package() {
    # install game icon
    install -Dm644 "${srcdir}/goggame-1207659168_7_256x256x32.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

    mkdir -p "${pkgdir}/opt/${_pkgname}/data"

    # install data files
    cp -r ${srcdir}/data/* ${pkgdir}/opt/${_pkgname}/data/
    cd "${pkgdir}/opt/${_pkgname}/data"
    rm aidata.vsc mapnames.vsc models/e1/e1decoinfo.csv models/e2/e2decoinfo.csv models/e3/e3decoinfo.csv models/e4/e4decoinfo.csv monstersounds.vsc multiplayermaps.vsc multiplayermaps2.vsc music/E3B.mp3 music/music.vsc sidekickambient.vsc sounds/e1/m_mwguard.vsc weapons.vsc
}
