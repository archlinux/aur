# Template — render with packaging/instantiate.sh
# Maintainer: Captain Kill Switch Team <support@captainkillswitch.com>
# -bin package: repacks the released Debian package (static musl binary, no deps).
pkgname=captain-kill-switch-bin
pkgver=0.2.98
pkgrel=1
pkgdesc="Close every running application in one click from the system tray"
arch=('x86_64')
url="https://captainkillswitch.com"
license=('LicenseRef-Proprietary')
provides=('captain-kill-switch')
conflicts=('captain-kill-switch')
depends=('hicolor-icon-theme')
options=('!strip')
source=("https://github.com/captainkillswitch/downloads/releases/download/v${pkgver}/captain-kill-switch-${pkgver}-linux-amd64.deb")
sha256sums=('81fc5c8f3fffdc65202f509f066ca09ecfa9f47721b040b5e81ad706ce6ae61f')

package() {
  # makepkg auto-extracts the .deb (ar archive) into srcdir; the payload lives
  # in data.tar.* whose compression is cargo-deb's choice — glob, don't assume.
  bsdtar -xf "$srcdir"/data.tar.* -C "$pkgdir/"
  # Ownership sanity: everything in the deb payload is root-owned usr/ content.
  chmod -R u+rwX,go+rX,go-w "$pkgdir/usr"
}
