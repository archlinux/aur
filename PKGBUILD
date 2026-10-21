# Maintainer: mak <mak@localhost>
pkgname=driveclub-pc-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Driveclub PC wrapper, native Linux build (requires your own game dump)"
arch=('x86_64')
url="https://github.com/DionSantosGG/Driveclub-pc-wrapper-linux"
license=('GPL-2.0-or-later')
depends=('glibc' 'gcc-libs' 'systemd-libs' 'fuse2')
provides=('driveclub-pc')
conflicts=('driveclub-pc')
options=('!strip')
source=("Driveclub-PC-linux-x86_64.AppImage::https://github.com/DionSantosGG/Driveclub-pc-wrapper-linux/releases/download/linux-v0.2.1%28SteamOS%29/Driveclub-PC-linux-x86_64.AppImage"
        'LICENSE'
        'driveclub-pc'
        'driveclub-pc.desktop')
sha256sums=('3dab7ef084fc1ebcf382a49fec009cb6b074989e413b63f5d10123274185e3b6'
            '8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643'
            '29138bd9b6fb5448a68ae4b19d987d6b833a87377e4c5479213b444f54692332'
            '449c18b90b26b836d2a2c00df5dea1f4a7d79012040f89ed077c548db192bf28')

prepare() {
  cd "$srcdir"
  chmod +x Driveclub-PC-linux-x86_64.AppImage
  ./Driveclub-PC-linux-x86_64.AppImage --appimage-extract \
    usr/share/icons/hicolor/512x512/apps/driveclub-pc.png >/dev/null
}

package() {
  install -Dm755 "$srcdir/Driveclub-PC-linux-x86_64.AppImage" \
    "$pkgdir/opt/ports/driveclub-pc/Driveclub-PC.AppImage"
  install -Dm644 "$srcdir/squashfs-root/usr/share/icons/hicolor/512x512/apps/driveclub-pc.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/driveclub-pc.png"
  install -Dm755 "$srcdir/driveclub-pc" "$pkgdir/usr/bin/driveclub-pc"
  install -Dm644 "$srcdir/driveclub-pc.desktop" \
    "$pkgdir/usr/share/applications/driveclub-pc.desktop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
