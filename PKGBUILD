# Maintainer: Hikari <xec[at]domain:tuta.io>
# gpg: curl https://bitbox.swiss/download/shiftcryptosec-509249B068D215AE.gpg.asc | gpg --import
# gpg --verify BitBox-4.48.4-macOS.dmg.asc
pkgname=bitbox-wallet-app-rpm
pkgver=4.49.0
_pkgver=4.49.0-1
pkgrel=1
pkgdesc="BitBox Wallet App for managing digital assets"
arch=('x86_64')
url="https://bitbox.swiss/"
license=('Apache License 2.0')
depends=('libxcb')
makedepends=('libarchive' 'curl')
source=("https://github.com/BitBoxSwiss/bitbox-wallet-app/releases/download/v${pkgver}/bitbox-${_pkgver}.${arch}.rpm")
sha256sums=('29fd54321a2fd7c7e8d18cce3b8f2a02a05fbf30335286dbc5b8b8b25d7d331c')
options=('strip')

package() {
  cd "$srcdir"

  # Extract RPM contents.
  bsdtar -xf "bitbox-${_pkgver}.${arch}.rpm" --directory="$pkgdir" --strip-components=1

  # Patching for X C Binding. No wayland support yet.
  sed -i 's|^Exec=.*|Exec=env QT_QPA_PLATFORM="xcb" /usr/bin/BitBox %u|' \
      "$pkgdir/usr/share/applications/bitbox.desktop"  
}
