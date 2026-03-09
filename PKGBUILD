# Maintainer: RayZ3R0

pkgname=sonami-gtk-bin
pkgver=1.5.3
pkgrel=1
pkgdesc="A Tidal music player for GNOME, built with GTK4 and Adwaita"
arch=('x86_64')
url="https://github.com/RayZ3R0/sonami-gtk"
license=('GPL-3.0-or-later')
provides=('sonami')
conflicts=('sonami' 'sonami-git')

depends=(
    'gtk4'
    'libadwaita'
    'glib2'
    'gstreamer'
    'gst-plugins-base'
    'gst-plugins-good'
    'gst-plugins-bad'
    'libsecret'
    'hicolor-icon-theme'
)

optdepends=(
    'gst-plugins-ugly: additional media codec support'
    'gst-libav: additional media codec support via FFmpeg'
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/RayZ3R0/sonami-gtk/releases/download/v${pkgver}/sonami-v${pkgver}-linux-x86_64.tar.gz")
sha256sums=('414d42d048ccceab1ca567a28ddf6e57b5b04b066a5213a544be22cb025b173b')

package() {
    cd "${srcdir}/sonami-v${pkgver}-linux-x86_64"

    # Binary
    install -Dm755 sonami "${pkgdir}/usr/bin/sonami"

    # Desktop entry
    install -Dm644 share/applications/dev.dergs.Sonami.desktop \
        "${pkgdir}/usr/share/applications/dev.dergs.Sonami.desktop"

    # AppStream metainfo
    install -Dm644 share/metainfo/dev.dergs.Sonami.metainfo.xml \
        "${pkgdir}/usr/share/metainfo/dev.dergs.Sonami.metainfo.xml"

    # Icons
    install -Dm644 share/icons/hicolor/scalable/apps/dev.dergs.Sonami.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/dev.dergs.Sonami.svg"
    install -Dm644 share/icons/hicolor/128x128/apps/dev.dergs.Sonami.png \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/dev.dergs.Sonami.png"
    install -Dm644 share/icons/hicolor/symbolic/apps/dev.dergs.Sonami-symbolic.svg \
        "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/dev.dergs.Sonami-symbolic.svg"

    # GSettings schema
    install -Dm644 share/glib-2.0/schemas/dev.dergs.Sonami.gschema.xml \
        "${pkgdir}/usr/share/glib-2.0/schemas/dev.dergs.Sonami.gschema.xml"
}
