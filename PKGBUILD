# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics
pkgver=0.1.105
pkgrel=1
pkgdesc="Agentics - the voice-driven AI platform launcher, the desktop front door for the entire Agentics ecosystem"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-0.1.105-x86_64::https://repo.agentics.co.za/x86_64/agentics-0.1.105-x86_64")
sha512sums=('1769cef7511106edf6a1333825307ab1687ddfb27d958c12620d9fa3b6623f31f56acaf4bdfbacc6da1865c046053aa2dafb06124f1e46f6a86af926fb9a55f6')

package() {
  install -Dm755 "$srcdir/agentics-0.1.105-x86_64" "$pkgdir/opt/agentics/Agentics.AppImage"
  install -dm755 "$pkgdir/usr/bin"
  printf '%s\n' '#!/bin/sh' 'exec /opt/agentics/Agentics.AppImage "$@"' > "$pkgdir/usr/bin/agentics"
  chmod 755 "$pkgdir/usr/bin/agentics"
  install -dm755 "$pkgdir/usr/share/applications"
  printf '%s\n' \
    '[Desktop Entry]' 'Type=Application' 'Name=Agentics' \
    'Comment=Voice-driven AI platform' 'Exec=/usr/bin/agentics %U' \
    'Icon=agentics' 'Categories=Utility;Network;AudioVideo;' 'Terminal=false' \
    > "$pkgdir/usr/share/applications/agentics.desktop"
}
