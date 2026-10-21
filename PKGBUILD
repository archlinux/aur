# Maintainer: Nomenclatura @ irc.libera.chat

# gpg: aria2c https://bitbox.swiss/download/shiftcryptosec-509249B068D215AE.gpg.asc | gpg --import

pkgname=bitbox-wallet-app-rpm
pkgver=4.52.0
_pkgver=4.52.0-1
pkgrel=1
pkgdesc="BitBox Wallet App for managing digital assets"
arch=('x86_64')
url="https://bitbox.swiss/"
license=('Apache License 2.0')
depends=('libxcb')
makedepends=('libarchive' 'curl')
source=("https://github.com/BitBoxSwiss/bitbox-wallet-app/releases/download/v${pkgver}/bitbox-${_pkgver}.${arch}.rpm")
sha256sums=('057ce18bca16cfd40d4f00dcc04e7908373660d78a746407d9572399313af52f')
options=('strip')

package() {
  cd "$srcdir"

  bsdtar -xf "bitbox-${_pkgver}.${arch}.rpm" --directory="$pkgdir" --strip-components=1

  # No wayland? Patching for X C Bindings:
  #sed -i 's|^Exec=.*|Exec=env QT_QPA_PLATFORM="xcb" /usr/bin/BitBox %u|' \
  #    "$pkgdir/usr/share/applications/bitbox.desktop"  
}
