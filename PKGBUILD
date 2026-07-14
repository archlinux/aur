# Maintainer: slitte <slitte@users.noreply.github.com>
pkgname=xfce-theme-switch
pkgver=1.0.3
pkgrel=1
pkgdesc="Automatic dark/light theme switcher for XFCE based on sun position, with system tray"
arch=('any')
url="https://github.com/slitte/xfce-theme-switch"
license=('MPL-2.0')
depends=(
    'python>=3.9'
    'python-gobject'
    'libappindicator3'
    'xfce4-settings'
    'glib2'
    'procps-ng'
)
optdepends=(
    'matcha-gtk-theme: default theme (dark/light)'
    'papirus-icon-theme: default icon theme'
    'qt5ct: Qt5 theme support'
    'qt6ct: Qt6 theme support'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('823c505243235c751ad8cae57e3db4d35390e932e9cbdfbb3d60d439d8956c42')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 bin/xfce-theme-switch "$pkgdir/usr/bin/xfce-theme-switch"
    install -Dm755 bin/xfce-theme-tray   "$pkgdir/usr/bin/xfce-theme-tray"

    install -Dm644 lib/xfce_theme_common.py \
        "$pkgdir/usr/lib/xfce-theme-switch/xfce_theme_common.py"

    install -Dm644 systemd/xfce-theme-switch.service \
        "$pkgdir/usr/lib/systemd/user/xfce-theme-switch.service"
    install -Dm644 systemd/xfce-theme-switch.timer \
        "$pkgdir/usr/lib/systemd/user/xfce-theme-switch.timer"
    install -Dm644 systemd/xfce-theme-tray.service \
        "$pkgdir/usr/lib/systemd/user/xfce-theme-tray.service"

    install -Dm644 LICENSE.md \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}
