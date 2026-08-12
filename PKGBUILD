# Template — render with packaging/instantiate.sh
# Maintainer: Captain Kill Switch Team <support@captainkillswitch.com>
# -bin package: repacks the released Debian package (static musl binary, no deps).
pkgname=captain-kill-switch-bin
pkgver=0.4.2
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
sha256sums=('3e2e7a39ef2e6b3ecefd55b472bed29f8fd8734e44c60bbafb19ba41d6beaa6f')

package() {
  # makepkg auto-extracts the .deb (ar archive) into srcdir; the payload lives
  # in data.tar.* whose compression is cargo-deb's choice — glob, don't assume.
  bsdtar -xf "$srcdir"/data.tar.* -C "$pkgdir/"
  # Ownership sanity: everything in the deb payload is root-owned usr/ content.
  chmod -R u+rwX,go+rX,go-w "$pkgdir/usr"
}
