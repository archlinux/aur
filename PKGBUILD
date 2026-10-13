# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-desktop
pkgver=0.1.65
pkgrel=1
pkgdesc="AzrOS - the Agentics agentic desktop with the Azros Agent built in"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-desktop-0.1.65-x86_64.AppImage::https://repo.agentics.co.za/x86_64/agentics-desktop-0.1.65-x86_64.AppImage")
sha512sums=('21e6a676dce5cfb474fbe2852550de74517ac23fa15429e0153fff35ec7b0bc8528fbb2b5ab6dda815771e08f12ed70d2f64fb46f6dc187244420af455d2036e')

package() {
  install -Dm755 "$srcdir/agentics-desktop-0.1.65-x86_64.AppImage" "$pkgdir/opt/agentics/azros.AppImage"
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
