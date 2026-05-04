# Maintainer: Matvel007 <matvel007@github.com>
pkgname=plasma-shortcut
pkgver=1.0
pkgrel=1
pkgdesc="Plasma GUI service menu for creating/editing .desktop shortcuts. Supports any file, .exe with Wine/Proton, auto-extracts icons / Plasma GUI сервисное меню для создания .desktop ярлыков. Любые файлы, .exe через Wine/Proton, авто-извлечение иконок"
arch=('any')
url="https://github.com/Matvel007/Plasma-Shortcut"
license=('GPL2')
depends=('kio' 'icoutils' 'pyside6')
install=plasma-shortcut.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/Matvel007/Plasma-Shortcut/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7604cfe7f186358a65a97362603192e2e72383033fa32cbe75fe221eba19ed86')

package() {
    cd "$srcdir/Plasma-Shortcut-$pkgver"
    install -Dm755 src/dolphin-create-shortcut \
        "$pkgdir/usr/local/bin/dolphin-create-shortcut"

    install -Dm755 src/dolphin-edit-shortcut \
        "$pkgdir/usr/local/bin/dolphin-edit-shortcut"

    install -Dm755 src/dolphin-shortcut-dialog.py \
        "$pkgdir/usr/local/share/create-shortcut/dolphin-shortcut-dialog.py"

    install -dm755 "$pkgdir/usr/share/kio/servicemenus"
    sed "s|PREFIX|/usr/local|g" src/create-shortcut.desktop \
        > "$pkgdir/usr/share/kio/servicemenus/create-shortcut.desktop"
    chmod 644 "$pkgdir/usr/share/kio/servicemenus/create-shortcut.desktop"

    sed "s|PREFIX|/usr/local|g" src/edit-shortcut.desktop \
        > "$pkgdir/usr/share/kio/servicemenus/edit-shortcut.desktop"
    chmod 644 "$pkgdir/usr/share/kio/servicemenus/edit-shortcut.desktop"
}
