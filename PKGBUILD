# Maintainer: tiouoo <tiouo@qq.com>

pkgname=portal-commit-bin
pkgver=0.40.20.53
pkgrel=1
pkgdesc="Portal - Minecraft launcher/manager (commit build, prerelease)"
arch=('x86_64')
url="https://portal.tiouo.cc/"
license=('GPL-3.0-or-later')
depends=('fuse2' 'hicolor-icon-theme' 'xdg-utils')
provides=("portal=$pkgver")
conflicts=('portal' 'portal-nightly-bin' 'portal-bin')
options=('!strip' '!emptydirs')
_appimg="Portal-0.40.20.53.AppImage"
source_x86_64=(
    "$_appimg::https://github.com/tiouoo/Portal/releases/download/publish-commit/Portal.linux.x64.0.40.20.53.AppImage"
    "portal.png::https://portal.tiouo.cc/portal-logo.png"
)
sha256sums_x86_64=('f217f0fceaa4debfd195993631690cdb935dbb097af45ebd14c1c78001d25317' 'SKIP')
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
