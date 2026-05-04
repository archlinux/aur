# Maintainer: openZro <dev@openzro.io>
#
# Sister package to openzro-bin — installs the desktop tray UI for
# operators on Arch / CachyOS / Manjaro / EndeavourOS who run a
# graphical session and want the openZro icon in the system tray
# (system status, quick connect/disconnect, profile switching).
#
# The CLI / daemon is NOT in this package — install `openzro-bin`
# alongside for the WireGuard interface management. The UI talks to
# the daemon over /var/run/openzro.sock.
#
# Linux UI ships amd64-only today (goreleaser_ui.yaml builds the GTK
# binary on a glibc x86_64 base image; arm64 builds aren't wired
# yet). When that lands the publish_aur_ui step bumps the arch list.
#
# Template substitutions handled by .github/workflows/release-binaries.yml:
#   0.53.1.alpha.35         pacman-safe version (hyphens → dots)
#   0.53.1-alpha.35        upstream tag without leading v
#   78fc394bd172296ad51f3c93d64df273bd54fa921118ff8f9d0aecc8a44ac0df  sha256 of openzro-ui_${REALVER}_linux_amd64.tar.gz
pkgname=openzro-ui-bin
_pkgname=openzro-ui
pkgver=0.53.1.alpha.35
_realver=0.53.1-alpha.35
pkgrel=1
pkgdesc="openZro desktop tray UI — system tray client for the daemon (prebuilt binary)"
arch=('x86_64')
url="https://openzro.io"
license=('BSD-3-Clause')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('openzro' 'gtk3' 'libappindicator-gtk3')
optdepends=('gnome-shell-extension-appindicator: system-tray icon support on GNOME 44+'
            'kde-appindicator-common: system-tray icon support on KDE Plasma')
source_x86_64=("openzro-ui-${_realver}-x86_64.tar.gz::https://github.com/openzro/openzro/releases/download/v${_realver}/openzro-ui_${_realver}_linux_amd64.tar.gz")
sha256sums_x86_64=('78fc394bd172296ad51f3c93d64df273bd54fa921118ff8f9d0aecc8a44ac0df')

package() {
    install -Dm0755 "$srcdir/openzro-ui" "$pkgdir/usr/bin/openzro-ui"
    install -Dm0644 "$srcdir/LICENSE"   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
