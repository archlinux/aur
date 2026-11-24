# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-desktop
pkgver=0.1.71
pkgrel=1
pkgdesc="AzrOS - the Agentics agentic desktop with the Azros Agent built in"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-desktop-0.1.71-x86_64.AppImage::https://repo.agentics.co.za/x86_64/agentics-desktop-0.1.71-x86_64.AppImage")
sha512sums=('39ba7184a495d65fd030252388755299a57e6722c3111156b4982ac5ad04cdfe1379d5d8e5275aecd42159ca10d0c453ad90b13dbc5cabad400ac121ba75af2a')

package() {
  install -Dm755 "$srcdir/agentics-desktop-0.1.71-x86_64.AppImage" "$pkgdir/opt/agentics/azros.AppImage"
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
