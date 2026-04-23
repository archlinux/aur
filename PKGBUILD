# Maintainer: Nick <evilnick002 at gmail dot com>
pkgname=vencord-installer-gui-bin
pkgver=1.3.3
pkgrel=1
pkgdesc="A GUI application to install Vencord with support for custom user plugins"
arch=('x86_64')
url="https://github.com/EvilNick2/vencord-installer-gui"
license=('MIT')
depends=(
    'cairo'
    'gdk-pixbuf2'
    'glib2'
    'gtk3'
    'hicolor-icon-theme'
    'libsoup3'
    'pango'
    'webkit2gtk-4.1'
)
provides=('vencord-installer-gui')
conflicts=('vencord-installer-gui')

source=(
    "$pkgname-$pkgver.deb::https://github.com/EvilNick2/vencord-installer-gui/releases/download/v$pkgver/Vencord.Installer.GUI_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/EvilNick2/vencord-installer-gui/main/LICENSE"
)
sha256sums=('44df724f3a65e3ca45ba3060da052dff676603e6572d8d6c068b55954e5b935b' 'SKIP')

prepare() {
    cd "$srcdir"
    ar x "$pkgname-$pkgver.deb"
    tar -xf data.tar.zst 2>/dev/null \
        || tar -xf data.tar.gz 2>/dev/null \
        || tar -xf data.tar.xz
}

package() {
    cd "$srcdir"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm755 usr/bin/vig \
        "$pkgdir/usr/bin/vig"

    install -Dm644 "usr/share/applications/Vencord Installer GUI.desktop" \
        "$pkgdir/usr/share/applications/vencord-installer-gui.desktop"

    install -Dm644 usr/share/icons/hicolor/32x32/apps/vig.png \
        "$pkgdir/usr/share/icons/hicolor/32x32/apps/vig.png"
    install -Dm644 usr/share/icons/hicolor/128x128/apps/vig.png \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/vig.png"
    install -Dm644 "usr/share/icons/hicolor/256x256@2/apps/vig.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/vig.png"
}
