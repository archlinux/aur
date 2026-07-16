# Maintainer: NC1107 <nickpconn@gmail.com>
pkgname=sink-bin
pkgver=0.1.21
pkgrel=1
pkgdesc="SteelSeries Sonar for Linux - per-app audio routing, mixing, and a processed virtual mic on PipeWire"
arch=('x86_64')
url="https://github.com/NC1107/sink"
license=('GPL-3.0-only')
# Direct library deps (providers of the binary's NEEDED sonames), the
# PipeWire session services, and the tray library. libayatana-appindicator
# is dlopen'd, but the app aborts on startup when it is missing, so it is a
# hard dep - it lives in extra, so `pacman -U` resolves it fine.
depends=('glibc' 'libgcc' 'glib2' 'gtk3' 'gdk-pixbuf2' 'cairo' 'dbus'
         'webkit2gtk-4.1' 'libsoup3' 'libpipewire' 'pipewire-pulse'
         'wireplumber' 'hicolor-icon-theme' 'libayatana-appindicator')
provides=('sink')
conflicts=('sink')
options=('!strip' '!debug')
source=("https://github.com/NC1107/sink/releases/download/v${pkgver}/sink_${pkgver}_amd64.deb")
noextract=("sink_${pkgver}_amd64.deb")
sha256sums=('6c0c57c3460ec8fd21d17c8e589b7f1889fff7ccaa69dfeff0eba37848d70efe')

package() {
  cd "${srcdir}"
  # The release .deb already ships the FHS layout (/usr/bin, .desktop,
  # hicolor icons) and links against system libraries; unpack its payload
  # straight into the package root.
  bsdtar -xf "sink_${pkgver}_amd64.deb"
  bsdtar -xf data.tar.* -C "${pkgdir}"
}
