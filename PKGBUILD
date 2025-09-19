# Maintainer: Hikari <xec[at]domain:tuta.io>
# gpg: curl https://bitbox.swiss/download/shiftcryptosec-509249B068D215AE.gpg.asc | gpg --import
# gpg --verify BitBox-4.48.4-macOS.dmg.asc
pkgname=bitbox-wallet-app-rpm
pkgver=4.48.1
_pkgver=4.48.1-1
pkgrel=1
pkgdesc="BitBox Wallet App for managing digital assets"
arch=('x86_64')
url="https://bitbox.swiss/"
license=('Apache License 2.0')
depends=('libxcb')
makedepends=('libarchive' 'curl')
source=("https://github.com/BitBoxSwiss/bitbox-wallet-app/releases/download/v${pkgver}/bitbox-${_pkgver}.${arch}.rpm")
sha256sums=('2404e2a50507c199d514e1a2173e119b4af5edde14cb18ec396753d25a7df5e4')
options=('strip')

package() {
  cd "$srcdir"

  # Extract RPM contents.
  bsdtar -xf "bitbox-${_pkgver}.${arch}.rpm" --directory="$pkgdir" --strip-components=1

  # Patching for X C Binding. No wayland support yet.
  sed -i 's|^Exec=.*|Exec=env QT_QPA_PLATFORM="xcb" /usr/bin/BitBox %u|' \
      "$pkgdir/usr/share/applications/bitbox.desktop"  
}
