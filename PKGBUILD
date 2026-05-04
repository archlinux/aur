# Maintainer: Felix Stubner <felix.stubner@gmail.com>
#
# Sibling package to netscli-bin (the CLI/TUI). Ships the Tauri desktop
# app as a self-contained .AppImage rather than the .deb, since pacman
# users typically prefer not to depend on dpkg/Debian conventions for
# system integration.

pkgname=netscli-gui-bin
_appname=netscli-gui
pkgver=0.2.4
pkgrel=1
pkgdesc="Network scanner desktop app (Tauri 2 + React) — discover hosts, scan ports, DNS, ARP"
arch=('x86_64')
url="https://netscli.com"
license=('MIT')
provides=("${_appname}")
conflicts=("${_appname}")
# Tauri 2 GTK3 backend — same depends as the upstream Tauri AppImage
# expects on the host (webkit2gtk-4.1, gtk3, ayatana-appindicator).
# AppImage is largely self-contained but these are the runtime libs
# Tauri's window manager needs that aren't always pre-installed.
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
source_x86_64=("${pkgname}-${pkgver}.AppImage::https://github.com/fstubner/netscli/releases/download/v${pkgver}/netscli-gui-linux-x86_64.AppImage")
sha256sums_x86_64=('f14efe4e93c29d71ff8978f5dd02c619bbee7e7bd75fa75b67be4acedd05ceea')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" \
    "${pkgdir}/usr/bin/${_appname}"
}
