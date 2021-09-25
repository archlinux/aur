# Maintainer: John-Michael Mulesa <jmulesa at gmail dot com>
# Contributor: kyndair <kyndair at gmail dot com>

pkgname=doom3bfg-data-gog
_pkgname=doom3bfg
pkgver=1
_pkgver="1.14_(13452)"
pkgrel=1
pkgdesc="Doom 3 BFG data via GOG"
arch=('any')
url="https://www.gog.com/game/doom_3_bfg_edition"
license=('custom')
makedepends=('innoextract' 'icoutils')
provides=('doom3bfg-data')
conflicts=('doom3bfg-data-steam')
source=("setup_doom_3_bfg_${_pkgver}.exe::gogdownloader://doom_3_bfg_edition_game/en1installer0" "setup_doom_3_bfg_${_pkgver}-1.bin::gogdownloader://doom_3_bfg_edition_game/en1installer1")
sha256sums=('8e6796c0f81e90de726e57978858ebdc8e162366060736bb080a51c73151936f'
            'e71a1f1cf2674748046b677b88015a4807a624a14831a2e7ce1e084c82bd0952')

# If you want to use lgogdownloader add the following to /etc/makepkg.conf
# DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
DLAGENTS+=("gogdownloader::/usr/bin/echo Could not find gog installer file (%u). Manually download it to \"$(pwd)\", or set up a gogdownloader:// DLAGENT in /etc/makepkg.conf. See PKGBUILD for example.")

prepare() {
    innoextract -s "setup_doom_3_bfg_${_pkgver}.exe"
    icotool -x -o . app/goggame-*.ico
}

package() {
    mkdir -p $pkgdir/opt/${_pkgname}/base

    # install game icon
    install -Dm644 "${srcdir}/goggame-1135892318_7_128x128x32.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}-gog.png"

    # copy data structure
    cp -r $srcdir/app/base/* $pkgdir/opt/${_pkgname}/base/
}
