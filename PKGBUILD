# Maintainer: smiley <smiley@aur.archlinux.org>
# Contributor: aa2013 <https://github.com/aa2013>

pkgname=clipshare-appimage
pkgver=1.4.4
pkgrel=1
pkgdesc="A cross-platform clipboard history and synchronization software (AppImage)"
arch=('x86_64')
url="https://github.com/aa2013/ClipShare"
license=('GPL3')
options=('!strip' '!debug')
depends=('fuse2')
provides=('clipshare')
conflicts=('clipshare')
source=(
  "clipshare.AppImage::https://github.com/aa2013/ClipShare/releases/download/v$pkgver/clipshare-${pkgver}+26-linux.AppImage"
  "clipshare.png::https://raw.githubusercontent.com/aa2013/ClipShare/v$pkgver/assets/images/logo/logo.png"
)
sha256sums=('c03757856512d9d42c4cd1406f4abb9f85d936a1f509e54a77991c59ed445ee2'
            '04c64dad8ffbd3a43b399b157a29457a755feb08060a731f07b43124ef66dd08')

package() {
  install -dm755 "$pkgdir/usr/lib/$pkgname"
  install -dm755 "$pkgdir/usr/bin"

  install -Dm755 "$srcdir/clipshare.AppImage" "$pkgdir/usr/lib/$pkgname/clipshare.AppImage"

  cat > "$pkgdir/usr/bin/clipshare" <<EOF
#!/bin/sh
exec /usr/lib/$pkgname/clipshare.AppImage "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/clipshare"

  install -Dm644 "$srcdir/clipshare.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<DESKTOPEOF
[Desktop Entry]
Name=ClipShare
Comment=Cross-platform clipboard history and synchronization
Exec=/usr/bin/clipshare
Icon=$pkgname
Type=Application
Categories=Utility;
Terminal=false
StartupNotify=true
DESKTOPEOF
}
