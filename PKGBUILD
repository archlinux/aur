# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics
pkgver=0.1.102
pkgrel=1
pkgdesc="Agentics - the voice-driven AI platform launcher, the desktop front door for the entire Agentics ecosystem"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-0.1.102-x86_64::https://repo.agentics.co.za/x86_64/agentics-0.1.102-x86_64")
sha512sums=('19021123082e35f378ca25800f33b04c4dd68368f7042d1814cddb6e27f324376e0068822c8e4f4b27a96d8be4abd098134649acfa5965c4fe44c2d67220423f')

package() {
  install -Dm755 "$srcdir/agentics-0.1.102-x86_64" "$pkgdir/opt/agentics/Agentics.AppImage"
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
