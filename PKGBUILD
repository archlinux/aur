# Maintainer: Mike Nagie <echo 'cHJvbWlrZTE5ODdAZ21haWwuY29tCg==' | base64 -d>

pkgname=ldoce5viewer
pkgver=2013.04.24
pkgrel=1
pkgdesc="Fast, free viewer for the Longman Dictionary of Contemporary English 5th Edition"
url="http://hakidame.net/ldoce5viewer/"
license=(GPL3)
arch=('any')
depends=(pyqt python-lxml gstreamer0.10-python gstreamer0.10-good gstreamer0.10-ugly-plugins)
install=ldoce5viewer.install
source=(http://hakidame.net/ldoce5viewer/static/packages/$pkgname-$pkgver.tar.gz)
md5sums=('086b5de509c669bb220c8ba6464bb7a6')


build() {
    cd "$srcdir/$pkgname-$pkgver"

    python3 setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    python3 setup.py install --optimize=1 --root="$pkgdir"
    install -Dm644 "ldoce5viewer/qtgui/resources/ldoce5viewer.svg" \
        "$pkgdir/usr/share/pixmaps/ldoce5viewer.svg"
    install -Dm644 "ldoce5viewer.desktop" \
        "$pkgdir/usr/share/applications/ldoce5viewer.desktop"
    install -Dm644 "LICENSE.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
    install -Dm644 "COPYING.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/COPYING.txt"
}
