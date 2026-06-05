# Maintainer: Jahroots <jahroots972@gmail.com>
pkgname=hexkit
pkgver=0.3.2
pkgrel=1
pkgdesc="Hex map editor for tabletop games"
arch=('x86_64')
url="https://github.com/trinvh/hexkit"
license=('custom')
depends=(
    'gtk3'
    'webkit2gtk-4.1'
    'glib2'
    'gstreamer'
    'gst-plugins-base'
    'libsecret'
    'hidapi'
    'hicolor-icon-theme'
)
source=("${pkgname}-${pkgver}.rpm::https://github.com/trinvh/hexkit/releases/download/v${pkgver}/Hexkit-${pkgver}-1.x86_64.rpm")
sha256sums=('dc536eb074e57e77f7a9e4410addf9729ea8852a76e610e4d3ad42677a89589e')

prepare() {
    cd "$srcdir"
    # Extract RPM using rpm2cpio (from pacman package 'rpm-tools')
    rpm2cpio "${pkgname}-${pkgver}.rpm" | cpio -id --quiet
}

package() {
    cd "$srcdir"

    install -Dm755 usr/bin/Hexkit     "$pkgdir/usr/bin/Hexkit"
    install -Dm755 usr/bin/hexkit-cli "$pkgdir/usr/bin/hexkit-cli"

    install -Dm644 usr/share/applications/Hexkit.desktop \
        "$pkgdir/usr/share/applications/Hexkit.desktop"

    install -Dm644 usr/share/icons/hicolor/32x32/apps/Hexkit.png \
        "$pkgdir/usr/share/icons/hicolor/32x32/apps/Hexkit.png"
    install -Dm644 usr/share/icons/hicolor/128x128/apps/Hexkit.png \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/Hexkit.png"
    install -Dm644 "usr/share/icons/hicolor/256x256@2/apps/Hexkit.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/Hexkit.png"
}
