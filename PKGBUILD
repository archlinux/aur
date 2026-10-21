# Maintainer: Eric Bakker <musqz at mf dot com>
pkgname=quickbox-qt
pkgver=1.3.3
pkgrel=1
pkgdesc="Qt6/PySide6 GUI front-end for quickemu"
arch=('any')
url="https://codeberg.org/linux-bird/quickbox-qt"
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bcb3f2e5ee0af82c63421b0591b93173ba558f43ffbc558360fcc686b4b9e772')

package() {
    cd "$srcdir/$pkgname"

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
