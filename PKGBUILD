# Maintainer: Hikari <xec[at]domain:tuta.io>
pkgname=bitbox-wallet-app-rpm
pkgver=4.47.3
_pkgver=4.47.3-1
pkgrel=1
pkgdesc="BitBox Wallet App for managing digital assets"
arch=('x86_64')
url="https://bitbox.swiss/"
license=('Apache License 2.0')
depends=('bitbox-udev' 'libxcb')
makedepends=('libarchive' 'curl')
source=("https://github.com/BitBoxSwiss/bitbox-wallet-app/releases/download/v${pkgver}/bitbox-${_pkgver}.${arch}.rpm")
sha256sums=('bbb1d69c0f6d86accda3fc6fb67ca8a3114e224974a45a3cf45bf8e7e7351ce5')

package() {
  cd "$srcdir"

  # Extract RPM contents.
  bsdtar -xf "bitbox-${_pkgver}.${arch}.rpm" --directory="$pkgdir" --strip-components=1

  # Patching for X C Binding. No wayland support yet.
  sed -i 's|^Exec=.*|Exec=env QT_QPA_PLATFORM="xcb" /usr/bin/BitBox %u|' \
      "$pkgdir/usr/share/applications/bitbox.desktop"  
}
