# Maintainer: Eric Bakker <musqz at mf dot com>
pkgname=quickbox-qt
pkgver=1.3.2
pkgrel=1
pkgdesc="Qt6/PySide6 GUI front-end for quickemu"
arch=('any')
url="https://github.com/musqz/quickbox-qt"
license=('MIT')
depends=(
    'python'
    'pyside6'
    'quickemu'
    'rsync'
    'xdg-utils'
)
optdepends=(
    'virt-viewer: SPICE display backend support'
)
conflicts=('quickbox')
provides=('quickbox')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c72b7a39436cc64222c18d29b630ea9367f5ed7e26f459f549e362923d4f7e91')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 quickbox        "$pkgdir/usr/bin/quickbox"
    install -Dm644 LICENSE         "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    for f in translations/*.json; do
        install -Dm644 "$f" "$pkgdir/usr/share/$pkgname/$f"
    done

    install -Dm644 packaging/quickbox.desktop \
        "$pkgdir/usr/share/applications/quickbox.desktop"

    # Icon
    install -Dm644 "icons/hicolor/scalable/apps/quickbox.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/quickbox.svg"

    # Version
    install -Dm644 version.txt "$pkgdir/usr/share/quickbox-qt/version.txt"
}
