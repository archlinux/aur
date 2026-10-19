# Maintainer: Nick <evilnick002 at gmail dot com>
pkgname=ron-mod-manager-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="A mod manager for Ready or Not"
arch=('x86_64')
url="https://github.com/EvilNick2/ron-mod-manager"
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
provides=('ron-mod-manager')
conflicts=('ron-mod-manager')

source=(
    "$pkgname-$pkgver.deb::https://github.com/EvilNick2/ron-mod-manager/releases/download/v$pkgver/RoN.Mod.Manager_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/EvilNick2/ron-mod-manager/main/LICENSE"
)
sha256sums=('3f00f66f317e1a26487e1ec13169c012f99628ef49c1dc381fc32a1d83ce9e76' 'SKIP')

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

    install -Dm755 usr/bin/ron-mod-manager \
        "$pkgdir/usr/bin/ron-mod-manager"

    install -Dm644 "usr/share/applications/RoN Mod Manager.desktop" \
        "$pkgdir/usr/share/applications/ron-mod-manager.desktop"

    install -Dm644 usr/share/icons/hicolor/32x32/apps/ron-mod-manager.png \
        "$pkgdir/usr/share/icons/hicolor/32x32/apps/ron-mod-manager.png"
    install -Dm644 usr/share/icons/hicolor/128x128/apps/ron-mod-manager.png \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/ron-mod-manager.png"
    install -Dm644 "usr/share/icons/hicolor/256x256@2/apps/ron-mod-manager.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/ron-mod-manager.png"
}
