# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=azros-agent
pkgver=0.1.53
pkgrel=1
pkgdesc="Azros Agent - the Azros coding agent on its own, building into your AzrOS Workspace"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("azros-agent-0.1.53-x86_64.AppImage::https://repo.agentics.co.za/x86_64/azros-agent-0.1.53-x86_64.AppImage")
sha512sums=('ff3482cd74aff85db4c346d08fe2a2f0c425d92d5373a318055ffdbd16d6b57e7879b9fc9e49fa2ccfb14a88e4b6177114f560e68926ffe98fdf4cc11dfa7f0a')

package() {
  install -Dm755 "$srcdir/azros-agent-0.1.53-x86_64.AppImage" "$pkgdir/opt/agentics/azros-agent.AppImage"
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
