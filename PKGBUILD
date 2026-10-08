# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics
pkgver=0.1.94
pkgrel=1
pkgdesc="Agentics - the voice-driven AI platform launcher, the desktop front door for the entire Agentics ecosystem"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-0.1.94-x86_64::https://repo.agentics.co.za/x86_64/agentics-0.1.94-x86_64")
sha512sums=('8a6693eb3a0f2e5be6423cad612b8a2d4c1e8d3f5f62865e62adbf2ee213de4114864d26b50052e2944f1683007db4261cd51a2c271b27221f9d7ae63e42ec2e')

package() {
  install -Dm755 "$srcdir/agentics-0.1.94-x86_64" "$pkgdir/opt/agentics/Agentics.AppImage"
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
