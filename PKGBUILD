# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=gentics
pkgver=0.1.66
pkgrel=1
pkgdesc="Agentics - the voice-driven AI platform launcher, the desktop front door for the entire Agentics ecosystem"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("gentics-0.1.66-x86_64.AppImage::https://software.agentics.co.za/agentics/x86_64/gentics-0.1.66-x86_64.AppImage")
sha512sums=('019ce49342cc553c1b2a0ee4a79a228340b2db48f809217238cee7713294abef955833525de68980ae152ef9d9421fffc47065986bc88d300b865b92a8340669')

package() {
  install -Dm755 "$srcdir/gentics-0.1.66-x86_64.AppImage" "$pkgdir/opt/agentics/Agentics.AppImage"
  install -dm755 "$pkgdir/usr/bin"
  printf '%s\n' '#!/bin/sh' 'exec /opt/agentics/Agentics.AppImage "$@"' > "$pkgdir/usr/bin/agentics"
  chmod 755 "$pkgdir/usr/bin/agentics"
  ln -s agentics "$pkgdir/usr/bin/gentics"
  install -dm755 "$pkgdir/usr/share/applications"
  printf '%s\n' \
    '[Desktop Entry]' 'Type=Application' 'Name=Agentics' \
    'Comment=Voice-driven AI platform' 'Exec=/usr/bin/agentics %U' \
    'Icon=agentics' 'Categories=Utility;Network;AudioVideo;' 'Terminal=false' \
    > "$pkgdir/usr/share/applications/agentics.desktop"
}
