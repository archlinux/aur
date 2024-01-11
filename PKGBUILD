# Maintainer: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>
# Contributor: Danny Dutton <duttondj@vt.edu>

pkgname=xinput_calibrator
pkgver=0.7.5
pkgrel=1
epoch=2
pkgdesc="Generic touchscreen calibration program for X.Org"
arch=('any')
url="http://www.freedesktop.org/wiki/Software/xinput_calibrator/"
license=('MIT' 'X11')
source=("https://github.com/tias/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d8edbf84523d60f52311d086a1e3ad0f3536f448360063dd8029bf6290aa65e9')

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
