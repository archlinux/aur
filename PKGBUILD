# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=azros-agent
pkgver=0.1.55
pkgrel=1
pkgdesc="Azros Agent - the Azros coding agent on its own, building into your AzrOS Workspace"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("azros-agent-0.1.55-x86_64.AppImage::https://repo.agentics.co.za/x86_64/azros-agent-0.1.55-x86_64.AppImage")
sha512sums=('2366cdf25a7c5021c7273571d8e17c5764631d674d93c0f6ec1bbf184d4696cffa4095b9191a2f16245a13ce34f36298af655de1f976c7fcdf6986622fcb90f1')

package() {
  install -Dm755 "$srcdir/azros-agent-0.1.55-x86_64.AppImage" "$pkgdir/opt/agentics/azros-agent.AppImage"
  install -dm755 "$pkgdir/usr/bin"
  printf '%s\n' '#!/bin/sh' 'exec /opt/agentics/azros-agent.AppImage "$@"' > "$pkgdir/usr/bin/azros-agent"
  chmod 755 "$pkgdir/usr/bin/azros-agent"
  install -dm755 "$pkgdir/usr/share/applications"
  printf '%s\n' \
    '[Desktop Entry]' 'Type=Application' 'Name=Azros Agent' \
    'Comment=the Azros coding agent on its own, building into your AzrOS Workspace' 'Exec=/usr/bin/azros-agent %U' \
    'Icon=agentics' 'Categories=Utility;Development;' 'Terminal=false' \
    > "$pkgdir/usr/share/applications/azros-agent.desktop"
}
