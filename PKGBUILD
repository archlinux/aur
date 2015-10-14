# Maintainer: Tom Pitcher <archlinux@tjbp.net>
# Contributor: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
# Contributor: Bob Finch <w9ya@qrparci.net>

pkgname='qsstv-testing'
pkgver='9.0.7'
pkgrel='1'
pkgdesc='Radio Slow-Scan TV for qt'
arch=('i686' 'x86_64')
url='http://users.telenet.be/on4qz/'
license=('GPL')
depends=('qt4' 'hamlib' 'fftw')
conflicts=('qsstv')
source=(
    "http://users.telenet.be/on4qz/qsstv_9/downloads/qsstv_${pkgver}.tar.gz"
    "qsstv.desktop"
)
sha256sums=(
    '4e2415ceca8830f56c958c24d4c3b7e25c98d1889f98e8920a0efef8f234b232'
    '6ec3f693b113f45f99ae889a38cd9518b6cb43dbf7b1855ac07c9b54be41e525'
)

build() {  
    pushd "$srcdir/qsstv_$pkgver"
    # trick qmake
    qmake-qt4 PREFIX=$pkgdir/usr/
    make $MAKEFLAGS
    popd
}

package() {
    pushd "$srcdir/qsstv_$pkgver"
    make INSTALL_ROOT="$pkgdir" install
    popd

    pushd "$srcdir"
    install -Dm644 qsstv.desktop $pkgdir/usr/share/applications/qsstv.desktop
    install -Dm644 $srcdir/qsstv_$pkgver/qsstv/icons/qsstv.png $pkgdir/usr/share/pixmaps/qsstv.png
    popd
}
