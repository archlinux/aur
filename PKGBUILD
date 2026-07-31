pkgname=sqrilizz-launcher-bin
pkgver=1.0.3
pkgrel=1
pkgdesc='Cross-platform Minecraft launcher for Sqrilizz Launcher'
arch=('x86_64')
url='https://github.com/Sqrilizz/SqrilizzLauncher'
license=('GPL-3.0-only')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator' 'openssl')
provides=('sqrilizz-launcher')
conflicts=('sqrilizz-launcher')
options=('!strip')
source=(
  "SqrilizzLauncher.AppImage::https://github.com/Sqrilizz/SqrilizzLauncher/releases/download/v${pkgver}/Sqrilizz.Launcher_${pkgver}_amd64.AppImage"
  "sqrilizz-launcher.png::https://raw.githubusercontent.com/Sqrilizz/SqrilizzLauncher/v${pkgver}/apps/app/icons/128x128.png"
)
sha256sums=('SKIP' 'SKIP')

package() {
  install -Dm755 "$srcdir/SqrilizzLauncher.AppImage" "$pkgdir/opt/sqrilizz-launcher/SqrilizzLauncher.AppImage"
  install -Dm644 "$srcdir/sqrilizz-launcher.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/sqrilizz-launcher.png"

  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/sqrilizz-launcher" <<'EOF'
#!/bin/sh
exec /opt/sqrilizz-launcher/SqrilizzLauncher.AppImage "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/sqrilizz-launcher"

  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/sqrilizz-launcher.desktop" <<'EOF'
[Desktop Entry]
Name=Sqrilizz Launcher
Comment=Cross-platform Minecraft launcher
Exec=sqrilizz-launcher %U
Icon=sqrilizz-launcher
Terminal=false
Type=Application
Categories=Game;
MimeType=application/x-modrinth-modpack+zip;x-scheme-handler/modrinth;
StartupWMClass=SqrilizzLauncher
EOF
}
