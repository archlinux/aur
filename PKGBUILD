# Maintainer: Agnays <srivasa@rose-hulman.edu>
pkgname=tsenta-desktop-bin
pkgver=3.3.2
pkgrel=1
pkgdesc="Tsenta - Automated job application assistant"
arch=('x86_64')
url="https://github.com/tsenta/tsenta-desktop-linux"
license=('custom')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libsecret' 'libappindicator')
provides=('tsenta-desktop')
conflicts=('tsenta-desktop')
options=('!strip')  # Skip stripping - already packaged binary

source=("https://github.com/tsenta/tsenta-desktop-linux/releases/download/v${pkgver}/tsenta-desktop_${pkgver}_amd64.deb")
sha256sums=('c0409127b5c1abe8a24f0388fa95a04f307c04cf2c9d3df0161776baa2a8095c')

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
