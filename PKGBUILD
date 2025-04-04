# Maintainer: Hikari <xec[at]domain:tuta.io>
pkgname=bitbox-wallet-app-rpm
pkgver=4.47.2
_pkgver=4.47.2-1
pkgrel=1
pkgdesc="BitBox Wallet App for managing digital assets"
arch=('x86_64')
url="https://bitbox.swiss/"
license=('Apache License 2.0')
depends=('bitbox-udev' 'libxcb')
makedepends=('libarchive' 'curl')
source=("https://github.com/BitBoxSwiss/bitbox-wallet-app/releases/download/v${pkgver}/bitbox-${_pkgver}.${arch}.rpm")
sha256sums=('e4ff21e4b23438ed0c2b818a68b2711c42d75500e53870a20ebf532aaefa8943')

package() {
  cd "$srcdir"

  # Extract RPM contents.
  bsdtar -xf "bitbox-${_pkgver}.${arch}.rpm" --directory="$pkgdir" --strip-components=1

  # Patching for X C Binding. No wayland support yet.
  sed -i 's|^Exec=.*|Exec=env QT_QPA_PLATFORM="xcb" /usr/bin/BitBox %u|' \
      "$pkgdir/usr/share/applications/bitbox.desktop"  
}
