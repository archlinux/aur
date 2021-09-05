# Maintainer: John-Michael Mulesa <jmulesa at gmail dot com>
# Contributor: kyndair <kyndair at gmail dot com>

pkgname=quake4-data-gog
_pkgname=quake4
pkgver=1
_pkgver="1.4.3_(13519)"
pkgrel=2
pkgdesc="Quake 4 data via GOG"
arch=('any')
url="https://www.gog.com/game/quake_4"
license=('custom')
makedepends=('innoextract' 'icoutils')
provides=('quake4-data')
conflicts=('quake4-data-steam')
source=("setup_quake_4_${_pkgver}.exe::gogdownloader://quake_4_game/en1installer0" "setup_quake_4_${_pkgver}-1.bin::gogdownloader://quake_4_game/en1installer1")
sha256sums=('4d09d3d11fca9d5122fc9af9aa12b8701742940b393b9bf63a4d9cdd825c4135'
            '9d163dbf728f8e2c00d26ac8de29a8b8e3bf1111d45ab320dea6371aaedd32eb')

# If you want to use lgogdownloader add the following to /etc/makepkg.conf
# DLAGENTS+=('goggogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
DLAGENTS+=("gogdownloader::/usr/bin/echo Could not find gog installer file (%u). Manually download it to \"$(pwd)\", or set up a gogdownloader:// DLAGENT in /etc/makepkg.conf. See PKGBUILD for example.")

prepare() {
    innoextract -s "setup_quake_4_${_pkgver}.exe"
    icotool -x -o . app/goggame-*.ico
}

package() {
    mkdir -p $pkgdir/opt/${_pkgname}/q4base

    # install game icon
    install -Dm644 "${srcdir}/goggame-1836059896_7_128x128x32.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}-gog.png"

    # install data packs
    cp $srcdir/app/q4base/pak0{01..12}.pk4 $pkgdir/opt/${_pkgname}/q4base/
    cp $srcdir/app/q4base/zpak*h.pk4 $pkgdir/opt/${_pkgname}/q4base/
}
