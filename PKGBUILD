# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-desktop
pkgver=0.1.47
pkgrel=1
pkgdesc="AzrOS - the Agentics agentic desktop with the Azros Agent built in"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-desktop-0.1.47-x86_64.AppImage::https://repo.agentics.co.za/x86_64/agentics-desktop-0.1.47-x86_64.AppImage")
sha512sums=('bf8501a87af9b1074b237a435450ea416bc5bf4a872a4cd25d5cd73941dd4ed290e209ead06d384ddc4c00fae13966834af637bee109ce805b86765b09cccc3d')

package() {
  install -Dm755 "$srcdir/agentics-desktop-0.1.47-x86_64.AppImage" "$pkgdir/opt/agentics/azros.AppImage"
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
