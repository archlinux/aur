# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics
pkgver=0.1.87
pkgrel=1
pkgdesc="Agentics - the voice-driven AI platform launcher, the desktop front door for the entire Agentics ecosystem"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-0.1.87-x86_64::https://repo.agentics.co.za/x86_64/agentics-0.1.87-x86_64")
sha512sums=('90114631ffc1c5d00f03db6a2a15286a2a611b6cbebe25667ff52e906af82f7b04cc0e294e17a8ca8db8c31921ed64cc06b9a18d8941c3e3f92aeb1f83445ad1')

package() {
  install -Dm755 "$srcdir/agentics-0.1.87-x86_64" "$pkgdir/opt/agentics/Agentics.AppImage"
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
