# Maintainer: tiouoo <tiouo@qq.com>

pkgname=portal-mc-commit-bin
pkgver=0.40.19.40
pkgrel=1
pkgdesc="Portal - Minecraft launcher/manager (commit build, prerelease)"
arch=('x86_64')
url="https://portal.tiouo.cc/"
license=('GPL-3.0-or-later')
depends=('fuse2' 'hicolor-icon-theme' 'xdg-utils')
provides=("portal-mc=$pkgver")
conflicts=('portal-mc' 'portal-mc-nightly-bin' 'portal-mc-bin')
options=('!strip' '!emptydirs')
_appimg="Portal.AppImage"
source_x86_64=(
    "$_appimg::https://github.com/tiouoo/Portal/releases/download/publish-commit/Portal.linux.x64.AppImage"
    "portal-mc.svg::https://portal.tiouo.cc/portal-logo.svg"
)
sha256sums_x86_64=('14d3ae2ad7f79cac73d0a5cde87b5ec5ae4393204726a84b658489148ba3d9ab' 'SKIP')
noextract=("$_appimg")

package() {
    install -Dm755 "$srcdir/$_appimg" "$pkgdir/opt/portal-mc/Portal.AppImage"
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/portal-mc" <<'EOF'
#!/bin/sh
exec /opt/portal-mc/Portal.AppImage "$@"
EOF
    install -Dm644 "$srcdir/portal-mc.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/portal-mc.svg"
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/portal-mc.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Portal
Comment=Portal - Minecraft launcher/manager
Icon=portal-mc
Exec=portal-mc %U
Terminal=false
Categories=Game;
MimeType=x-scheme-handler/portal;application/zip;application/x-zip-compressed;
EOF
}
