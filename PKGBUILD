# Maintainer: NC1107 <nickpconn@gmail.com>
pkgname=sink-bin
pkgver=0.1.36
pkgrel=1
pkgdesc="SteelSeries Sonar for Linux - per-app audio routing, mixing, and a processed virtual mic on PipeWire"
arch=('x86_64')
url="https://github.com/NC1107/sink"
license=('GPL-3.0-only')
# Direct library deps plus the tray library: libayatana-appindicator is
# dlopen'd, but the app aborts on startup without it, so it's a hard dep.
depends=('glibc' 'libgcc' 'glib2' 'gtk3' 'gdk-pixbuf2' 'cairo' 'dbus'
         'webkit2gtk-4.1' 'libsoup3' 'libpipewire' 'pipewire-pulse'
         'wireplumber' 'hicolor-icon-theme' 'libayatana-appindicator')
provides=('sink')
conflicts=('sink')
options=('!strip' '!debug')
source=("https://github.com/NC1107/sink/releases/download/v${pkgver}/sink_${pkgver}_amd64.deb")
noextract=("sink_${pkgver}_amd64.deb")
sha256sums=('38afbdeb6177868a4a9fac3f9d04bbcd2fee5496eae725370a09491fc43f584c')

package() {
  cd "${srcdir}"
  # The release .deb already ships the FHS layout; unpack its payload
  # straight into the package root.
  bsdtar -xf "sink_${pkgver}_amd64.deb"
  bsdtar -xf data.tar.* -C "${pkgdir}"
}
