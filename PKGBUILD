# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-desktop
pkgver=0.1.62
pkgrel=1
pkgdesc="AzrOS - the Agentics agentic desktop with the Azros Agent built in"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-desktop-0.1.62-x86_64.AppImage::https://repo.agentics.co.za/x86_64/agentics-desktop-0.1.62-x86_64.AppImage")
sha512sums=('f978d00763ad24ff2beef232707a283cb3a71e3ad4891e16ecab242f33cf2a1c15e84d4b114660e051f9d7a9c89ee27d743f2160cfcd7106caf8b08dae062b66')

package() {
  install -Dm755 "$srcdir/agentics-desktop-0.1.62-x86_64.AppImage" "$pkgdir/opt/agentics/azros.AppImage"
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
