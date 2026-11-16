# Maintainer: dayvster <dayvi dot schuster at protonmail dot com>

# Repackages the x86_64 Linux bundle from the GitHub release. The binary links Qt 6
# dynamically, so it uses Arch's Qt.
pkgname=zenkai-bin
pkgver=1.5
pkgrel=1
pkgdesc="Fast application launcher with plugins, themes and window switching"
arch=('x86_64')
url="https://github.com/dayvster/zenkai"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-svg' 'glibc' 'gcc-libs' 'hicolor-icon-theme')
optdepends=('qt6-wayland: Wayland support'
            'xdg-utils: open URLs and files'
            'wmctrl: window layout actions on X11'
            'xorg-xrandr: monitor layout actions on X11'
            'kwinctl: control KDE Plasma windows from the command line')
provides=('zenkai')
conflicts=('zenkai')
# The release binary is already stripped, so there's nothing for a debug package.
options=('!debug')
source=("https://github.com/dayvster/zenkai/releases/download/v$pkgver/zenkai-v$pkgver-linux-x64.tar.gz")
sha256sums=('6cc0a5e44dd28022e6031226149912d834bda53d33be24d187981c90872e0352')

package() {
    cd "zenkai-v$pkgver-linux-x64"
    install -Dm755 zenkai "$pkgdir/usr/bin/zenkai"
    install -Dm644 zenkai.desktop "$pkgdir/usr/share/applications/zenkai.desktop"
    install -Dm644 zenkai.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/zenkai.png"
    install -Dm644 README.md "$pkgdir/usr/share/doc/zenkai/README.md"
    install -Dm644 LICENCE.md "$pkgdir/usr/share/licenses/$pkgname/LICENCE.md"
    # zenkai looks for bundled plugins and translations in /usr/share/zenkai.
    install -dm755 "$pkgdir/usr/share/zenkai"
    cp -r external/plugins external/translations "$pkgdir/usr/share/zenkai/"
}
