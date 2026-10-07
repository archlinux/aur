# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=azros-agent
pkgver=0.1.54
pkgrel=1
pkgdesc="Azros Agent - the Azros coding agent on its own, building into your AzrOS Workspace"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("azros-agent-0.1.54-x86_64.AppImage::https://repo.agentics.co.za/x86_64/azros-agent-0.1.54-x86_64.AppImage")
sha512sums=('e8b9633418e4ea14b3c27b211a37aa18d62c3b6e9ab416551a16ad06c87eaaff6b19c675ddf20b1550bf0bc13d5a705ec2ba2a688d0fcbfc31f4c98e9c6cbbd7')

package() {
  install -Dm755 "$srcdir/azros-agent-0.1.54-x86_64.AppImage" "$pkgdir/opt/agentics/azros-agent.AppImage"
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
