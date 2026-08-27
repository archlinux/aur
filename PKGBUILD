# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics
pkgver=0.1.77
pkgrel=1
pkgdesc="Agentics - the voice-driven AI platform launcher, the desktop front door for the entire Agentics ecosystem"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-0.1.77-x86_64::https://repo.agentics.co.za/x86_64/agentics-0.1.77-x86_64")
sha512sums=('41f966181c03c8ea3492b33669a7763f14cff5ebf9eba32a358f574021eb02d86c57abe631e0e2ab724c206d8646bee3767101bb10222d1594a96e2e52964ac1')

package() {
  install -Dm755 "$srcdir/agentics-0.1.77-x86_64" "$pkgdir/opt/agentics/Agentics.AppImage"
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
