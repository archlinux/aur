# Maintainer: Eric Bakker <musqz at mf dot com>
pkgname=quickbox-qt
pkgver=1.4.0
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
    'libnotify: desktop notifications'
    'parted: format disk'
    'dosfstools: format disk (FAT32/EFI partition)'
    'qemu-img: format disk (qemu-nbd)'
    'virt-viewer: SPICE display backend support'
)
conflicts=('quickbox')
provides=('quickbox')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('250cff086f7310caa3cd02dd8a0bceaea52a750ba072ed682ee5aa71f63c8963')

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
