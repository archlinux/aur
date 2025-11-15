# Maintainer: Agnays <srivasa@rose-hulman.edu>
pkgname=tsenta-desktop-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Tsenta - Automated job application assistant"
arch=('x86_64')
url="https://github.com/tsenta/tsenta-desktop"
license=('custom')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libsecret' 'libappindicator')
provides=('tsenta-desktop')
conflicts=('tsenta-desktop')
options=('!strip')  # Skip stripping - already packaged binary

source=("https://github.com/tsenta/tsenta-desktop-linux/releases/download/v${pkgver}/tsenta-desktop_${pkgver}_amd64.deb")
sha256sums=('a612a3de63c953d5f8b1c169e58962a00a01b2a3084a683df223184c88295f80')

package() {
  cd "${srcdir}"

  # Extract the DEB package
  bsdtar -xf "tsenta-desktop_${pkgver}_amd64.deb"
  bsdtar -xf data.tar.xz -C "${pkgdir}"

  # Fix permissions
  chmod -R u+rwX,go+rX,go-w "${pkgdir}"

  # Ensure the binary is executable
  chmod +x "${pkgdir}/usr/bin/tsenta-desktop"
}
