# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-desktop
pkgver=0.1.61
pkgrel=1
pkgdesc="AzrOS - the Agentics agentic desktop with the Azros Agent built in"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-desktop-0.1.61-x86_64.AppImage::https://repo.agentics.co.za/x86_64/agentics-desktop-0.1.61-x86_64.AppImage")
sha512sums=('c527d4ba67548c875019b30b5d9a08a03229fff30dfb7f4f9ad128546548a4a29218cfb5a6735f081b96018641cb2a3bf6e961046cf157122d9acb080dc67dff')

package() {
  install -Dm755 "$srcdir/agentics-desktop-0.1.61-x86_64.AppImage" "$pkgdir/opt/agentics/azros.AppImage"
  install -dm755 "$pkgdir/usr/bin"
  printf '%s\n' '#!/bin/sh' 'exec /opt/agentics/azros.AppImage "$@"' > "$pkgdir/usr/bin/azros"
  chmod 755 "$pkgdir/usr/bin/azros"
  install -dm755 "$pkgdir/usr/share/applications"
  printf '%s\n' \
    '[Desktop Entry]' 'Type=Application' 'Name=AzrOS' \
    'Comment=the Agentics agentic desktop with the Azros Agent built in' 'Exec=/usr/bin/azros %U' \
    'Icon=agentics' 'Categories=Utility;Development;' 'Terminal=false' \
    > "$pkgdir/usr/share/applications/azros.desktop"
}
