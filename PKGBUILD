# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=azros-agent
pkgver=0.1.61
pkgrel=1
pkgdesc="Azros Agent - the Azros coding agent on its own, building into your AzrOS Workspace"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("azros-agent-0.1.61-x86_64.AppImage::https://repo.agentics.co.za/x86_64/azros-agent-0.1.61-x86_64.AppImage")
sha512sums=('07d10cc147956fd03a27825c3eb5d75db2fdc29c416039c97d41e6fe841e99206adcd76e6ec8c75c69cb6f69797838f9e9bed845bd0cac444bc8910edb6f284e')

package() {
  install -Dm755 "$srcdir/azros-agent-0.1.61-x86_64.AppImage" "$pkgdir/opt/agentics/azros-agent.AppImage"
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
