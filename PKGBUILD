# Maintainer: tiouoo <tiouo@qq.com>

pkgname=portal-mc-bin
pkgver=1.0.5
pkgrel=1
pkgdesc="Portal - Minecraft launcher/manager (stable release)"
arch=('x86_64')
url="https://portal.tiouo.cc/"
license=('GPL-3.0-or-later')
depends=('fuse2' 'hicolor-icon-theme' 'xdg-utils')
provides=("portal-mc=$pkgver")
conflicts=('portal-mc' 'portal-mc-commit-bin' 'portal-mc-nightly-bin')
options=('!strip' '!emptydirs')
_appimg="Portal.AppImage"
source_x86_64=(
    "$_appimg::https://github.com/tiouoo/Portal/releases/latest/download/Portal.linux.x64.AppImage"
    "portal.png::https://portal.tiouo.cc/portal-logo.png"
)
sha256sums_x86_64=('38001c4eb179c8785954043393ef941013abe417603ed066419da25470f9fe1a' 'SKIP')
noextract=("$_appimg")

package() {
    install -Dm755 "$srcdir/$_appimg" "$pkgdir/opt/portal/Portal.AppImage"
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/portal" <<'EOF'
#!/bin/sh
exec /opt/portal/Portal.AppImage "$@"
EOF
    install -Dm644 "$srcdir/portal.png" \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/portal.png"
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/portal.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Portal
Comment=Portal - Minecraft launcher/manager
Icon=portal
Exec=portal %U
Terminal=false
Categories=Game;
MimeType=x-scheme-handler/portal;application/zip;application/x-zip-compressed;
EOF
}
