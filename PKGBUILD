# Maintainer: CxOrg <clx.org@cloud-org.uk>
# Contributor: Felix Häcker <haeckerfelix@gnome.org>
pkgname=shortwave-mpris-bin
pkgver=5.1.0
pkgrel=1
pkgdesc="Internet radio player with extended MPRIS support, device support for DLNA/UPnP & Google Cast + FFmpeg proxy for incompatible streams"
arch=('x86_64' 'aarch64')
url="https://github.com/ixnewton/Shortwave-MPRIS"
license=('GPL3')
depends=(
    'gtk4>=4.18.0'
    'libadwaita>=1.8.0'
    'libshumate>=1.3.0'
    'gstreamer>=1.24.0'
    'gst-plugins-base-libs>=1.24.0'
    'gst-plugins-bad>=1.24.0'
    'gst-plugins-good'
    'gst-libav'
    'ffmpeg>=4.0.0'
    'sqlite>=3.20.0'
    'openssl>=1.0.0'
    'dbus'
    'glib2>=2.80.0'
    'glycin-gtk4>=2.0.0'
    'lcms2>=2.12.0'
    'libseccomp>=2.5.0'
)
provides=('shortwave' 'shortwave-mpris')
conflicts=('shortwave' 'shortwave-mpris')
options=('!lto')
install=shortwave-mpris-bin.install
source=("https://github.com/ixnewton/Shortwave-MPRIS/releases/download/v5.1.0/shortwave-mpris-5.1.0-linux-amd64.tar.gz")
sha256sums=('c3e7a957cd3c023e354307c2ec531744f4d8beecd46d90d8550a1c32ab90f597')

package() {
  # Install the binary
  install -Dm755 "$srcdir/shortwave-mpris_5.1.0_linux-amd64" "$pkgdir/usr/bin/shortwave"
  
  # Install desktop file
  install -Dm644 "$srcdir/de.haeckerfelix.Shortwave.desktop" \
    "$pkgdir/usr/share/applications/de.haeckerfelix.Shortwave.desktop"
  
  # Install GSettings schema
  install -Dm644 "$srcdir/de.haeckerfelix.Shortwave.gschema.xml" \
    "$pkgdir/usr/share/glib-2.0/schemas/de.haeckerfelix.Shortwave.gschema.xml"
  
  # Install metainfo
  install -Dm644 "$srcdir/de.haeckerfelix.Shortwave.metainfo.xml" \
    "$pkgdir/usr/share/metainfo/de.haeckerfelix.Shortwave.metainfo.xml"
  
  # Install D-Bus service file
  install -Dm644 "$srcdir/de.haeckerfelix.Shortwave.service" \
    "$pkgdir/usr/share/dbus-1/services/de.haeckerfelix.Shortwave.service"
  
  # Install gresource file
  install -Dm644 "$srcdir/de.haeckerfelix.Shortwave.gresource" \
    "$pkgdir/usr/share/shortwave/de.haeckerfelix.Shortwave.gresource"
  
  # Install icons
  install -Dm644 "$srcdir/de.haeckerfelix.Shortwave.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/de.haeckerfelix.Shortwave.svg"
  install -Dm644 "$srcdir/de.haeckerfelix.Shortwave-symbolic.svg" \
    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/de.haeckerfelix.Shortwave-symbolic.svg"
  
  # Install license
  install -Dm644 "$srcdir/COPYING.md" "$pkgdir/usr/share/licenses/$pkgname/COPYING.md"
}
