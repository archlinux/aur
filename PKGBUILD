# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=azros-agent
pkgver=0.1.47
pkgrel=1
pkgdesc="Azros Agent - the Azros coding agent on its own, building into your AzrOS Workspace"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("azros-agent-0.1.47-x86_64.AppImage::https://repo.agentics.co.za/x86_64/azros-agent-0.1.47-x86_64.AppImage")
sha512sums=('2fa8a48ddec22f24a451cc0210c4f5dbd400a4a50a50bcd3c4fc4cdf58fc318ca87b455ac4d31cb4d83dc9d0950d413f28d69587de89219efdfc4607364615e5')

package() {
  install -Dm755 "$srcdir/azros-agent-0.1.47-x86_64.AppImage" "$pkgdir/opt/agentics/azros-agent.AppImage"
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
