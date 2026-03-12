# Maintainer: RayZ3R0

pkgname=sonami-gtk-bin
pkgver=1.5.8
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

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/RayZ3R0/sonami-gtk/releases/download/v${pkgver}/sonami-gtk-v${pkgver}-linux-x86_64.tar.gz")
sha256sums=('3eadbeb74a82ef0e00e96a9b7dc87179e08cb35e23fb62503105ead4b65b5b4a')

package() {
    cd "${srcdir}/sonami-gtk-v${pkgver}-linux-x86_64"

    # Binary
    install -Dm755 sonami "${pkgdir}/usr/bin/sonami"

    # Desktop entry
    install -Dm644 share/applications/io.github.rayz3r0.SonamiGtk.desktop \
        "${pkgdir}/usr/share/applications/io.github.rayz3r0.SonamiGtk.desktop"

    # AppStream metainfo
    install -Dm644 share/metainfo/io.github.rayz3r0.SonamiGtk.metainfo.xml \
        "${pkgdir}/usr/share/metainfo/io.github.rayz3r0.SonamiGtk.metainfo.xml"

    # Icons
    install -Dm644 share/icons/hicolor/scalable/apps/io.github.rayz3r0.SonamiGtk.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.rayz3r0.SonamiGtk.svg"
    install -Dm644 share/icons/hicolor/128x128/apps/io.github.rayz3r0.SonamiGtk.png \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/io.github.rayz3r0.SonamiGtk.png"
    install -Dm644 share/icons/hicolor/symbolic/apps/io.github.rayz3r0.SonamiGtk-symbolic.svg \
        "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/io.github.rayz3r0.SonamiGtk-symbolic.svg"

    # GSettings schema
    install -Dm644 share/glib-2.0/schemas/io.github.rayz3r0.SonamiGtk.gschema.xml \
        "${pkgdir}/usr/share/glib-2.0/schemas/io.github.rayz3r0.SonamiGtk.gschema.xml"
}
