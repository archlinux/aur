# Maintainer: John-Michael Mulesa <jmulesa at gmail dot com>
# Contributor: kyndair <kyndair at gmail dot com>

pkgname=eliteforce-data-gog
_pkgname=eliteforce
pkgver=1
_pkgver="1.2_(34378)"
pkgrel=1
pkgdesc="Star Trek Voyager: Elite Force data via GOG"
arch=('any')
url="https://www.gog.com/game/star_trek_voyager_elite_force"
license=('custom')
makedepends=('innoextract' 'icoutils')
provides=('eliteforce-data')
source=("setup_star_trek_voyagertm_elite_force_${_pkgver}.exe::gogdownloader://star_trek_voyager_elite_force/en1installer0")
sha256sums=('2adb604a8916688689b700a9be3083903d036e1633e1fe675a97776891ac2ae8')

# If you want to use lgogdownloader add the following to /etc/makepkg.conf
# DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
DLAGENTS+=("gogdownloader::/usr/bin/echo Could not find gog installer file (%u). Manually download it to \"$(pwd)\", or set up a gogdownloader:// DLAGENT in /etc/makepkg.conf. See PKGBUILD for example.")

prepare() {
    innoextract -s "setup_star_trek_voyagertm_elite_force_${_pkgver}.exe"
    icotool -x -o . app/goggame-*.ico
}

package() {
    mkdir -p $pkgdir/opt/lilium-voyager/baseEF

    # install game icon
    install -Dm644 "${srcdir}/goggame-1581756945_7_256x256x32.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}-gog.png"

    # install data packs
    install -D -m 644 $srcdir/BaseEF/*.pk3 $pkgdir/opt/lilium-voyager/baseEF/
}
