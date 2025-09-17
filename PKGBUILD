# Maintainer: Pujan Modha <pujan.pm@hotmail.com>
pkgname=helium-browser-appimage
pkgver=0.4.6.1
pkgrel=1
pkgdesc="Helium web browser (AppImage) repackaged for Arch"
arch=('x86_64')
url="https://github.com/imputnet/helium-linux"
license=('GPL3')
depends=()
optdepends=('fuse2: run AppImage')
provides=('helium-browser')
options=(!strip)

_appimage="helium-${pkgver}-${arch}.AppImage"
source=(
  "${_appimage}::https://github.com/imputnet/helium-linux/releases/download/${pkgver}/${_appimage}"
  "helium.desktop"
  "helium.svg"
)
sha256sums=('b725fb77c177ac3999371263f1d75d4fbe737389842de50b718bdd75e6ea81dd' '8584fc8787460ba5f5b44cef0983758638970d982a4b5d8abd772dad9208abfa' '7eb2b8a0b00a8ccefe2b4712c298a9c320d8bbd44f6de9133621e3f3fdd34e7a')

package() {
  install -d "$pkgdir/opt/helium"
  install -m755 "${_appimage}" "$pkgdir/opt/helium/helium.AppImage"

  install -d "$pkgdir/usr/bin"
  printf '#!/bin/sh\nexec /opt/helium/helium.AppImage "$@"\n' > "$pkgdir/usr/bin/helium"
  chmod 755 "$pkgdir/usr/bin/helium"

  install -Dm644 "helium.desktop" "$pkgdir/usr/share/applications/helium.desktop"
  install -Dm644 "helium.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/helium.svg"
}
