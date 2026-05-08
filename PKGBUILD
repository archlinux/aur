# Maintainer: Matvel007 <matvel007@github.com>
pkgname=plasma-shortcut
pkgver=1.1
pkgrel=1
pkgdesc="Dolphin service menu: .desktop shortcuts + GPU launch mode (Intel/NVIDIA). Wine/Proton/Flatpak support / Сервисное меню Dolphin: ярлыки .desktop + режим GPU (Intel/NVIDIA). Wine/Proton/Flatpak"
arch=('any')
url="https://github.com/Matvel007/Plasma-Shortcut"
license=('GPL2')
depends=('kio' 'icoutils' 'pyside6')
install=plasma-shortcut.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/Matvel007/Plasma-Shortcut/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('70d0ff130c96e21f8a29940ebb410b4b9b00bced153ca16627dd7f1edf5636cb')

package() {
    cd "$srcdir/Plasma-Shortcut-$pkgver"
    install -Dm755 src/dolphin-create-shortcut \
        "$pkgdir/usr/local/bin/dolphin-create-shortcut"

    install -Dm755 src/dolphin-edit-shortcut \
        "$pkgdir/usr/local/bin/dolphin-edit-shortcut"

    install -Dm755 src/dolphin-launch-mode \
        "$pkgdir/usr/local/bin/dolphin-launch-mode"

    install -Dm755 src/dolphin-shortcut-dialog.py \
        "$pkgdir/usr/local/share/create-shortcut/dolphin-shortcut-dialog.py"

    install -Dm755 src/dolphin-launch-mode-dialog.py \
        "$pkgdir/usr/local/share/create-shortcut/dolphin-launch-mode-dialog.py"

    install -dm755 "$pkgdir/usr/share/kio/servicemenus"
    sed "s|PREFIX|/usr/local|g" src/create-shortcut.desktop \
        > "$pkgdir/usr/share/kio/servicemenus/create-shortcut.desktop"
    chmod 644 "$pkgdir/usr/share/kio/servicemenus/create-shortcut.desktop"

    sed "s|PREFIX|/usr/local|g" src/edit-shortcut.desktop \
        > "$pkgdir/usr/share/kio/servicemenus/edit-shortcut.desktop"
    chmod 644 "$pkgdir/usr/share/kio/servicemenus/edit-shortcut.desktop"

    sed "s|PREFIX|/usr/local|g" src/launch-mode.desktop \
        > "$pkgdir/usr/share/kio/servicemenus/launch-mode.desktop"
    chmod 644 "$pkgdir/usr/share/kio/servicemenus/launch-mode.desktop"
}
