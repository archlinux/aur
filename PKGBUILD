# Maintainer: Danny Dutton <duttondj@vt.edu>

pkgname=xinput_calibrator
pkgver=0.7.5
pkgrel=3
pkgdesc="Generic touchscreen calibration program for X.Org"
arch=('i686' 'x86_64')
url="http://www.freedesktop.org/wiki/Software/xinput_calibrator/"
license=('MIT')
source=("http://github.com/downloads/tias/${pkgname}/${pkgname}-${pkgver}.tar.gz")

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./autogen.sh --with-gui=x11
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    install -Dm644 scripts/xinput_calibrator.svg "$pkgdir/usr/local/share/pixmaps/xinput_calibrator.svg"
    install -Dm644 scripts/xinput_calibrator.xpm "$pkgdir/usr/local/share/pixmaps/xinput_calibrator.xpm"
    install -Dm644 scripts/xinput_calibrator.desktop "$pkgdir/usr/local/share/applications/xinput_calibrator.desktop"
    install -Dm755 src/xinput_calibrator "$pkgdir/usr/local/bin/xinput_calibrator"
    cd man
    gzip xinput_calibrator.1
    install -Dm644 xinput_calibrator.1.gz "$pkgdir/usr/share/man/man1/xinput_calibrator.1.gz"
}
md5sums=('20da0a2055a5a75962add8c6b44f60fa')
