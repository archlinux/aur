# Maintainer: Agnays <srivasa@rose-hulman.edu>
pkgname=tsenta-desktop-bin
pkgver=3.0.2
pkgrel=2
pkgdesc="Tsenta - Automated job application assistant"
arch=('x86_64')
url="https://github.com/tsenta/tsenta-desktop-linux"
license=('custom')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libsecret' 'libappindicator')
provides=('tsenta-desktop')
conflicts=('tsenta-desktop')
options=('!strip')  # Skip stripping - already packaged binary

source=("https://github.com/tsenta/tsenta-desktop-linux/releases/download/v${pkgver}/tsenta-desktop_${pkgver}_amd64.deb")
sha256sums=('bb95e7898512e79b030746a4da956c576cc2095d7ff42e14517bc83cabf8d30b')

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
