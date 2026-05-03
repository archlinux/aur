# Maintainer: Ayman Lyesri <ayman.lyesri.99@gmail.com>

pkgname=wuwa-moma-bin
pkgver=0.1.39
pkgrel=1
pkgdesc="Wuthering Waves Mod Manager (Tauri)"
arch=('x86_64')
url="https://github.com/AymanLyesri/wuwa-mod-manager"
license=('MIT')
depends=('gtk3' 'libappindicator-gtk3')
provides=('wuwa-moma')
conflicts=('wuwa-moma')

source=("wuwa-moma-bin-0.1.39.AppImage::https://github.com/AymanLyesri/wuwa-mod-manager/releases/download/app-v0.1.39/WuwaMoMa_0.1.39_amd64.AppImage")
sha256sums=('0f9ee88a0c6c6b7a17bd685aa17ae2716d9e7bd74d33277c71336ef0ad938373')

prepare() {
  chmod +x "$srcdir/$pkgname-$pkgver.AppImage"
  "$srcdir/$pkgname-$pkgver.AppImage" --appimage-extract
}

package() {
  cd "$srcdir/squashfs-root"

  # install binary
  install -Dm755 usr/bin/wuwa_mod_manager \
    "$pkgdir/usr/bin/wuwa-moma"

  # install desktop file
  install -Dm644 usr/share/applications/WuwaMoMa.desktop \
    "$pkgdir/usr/share/applications/wuwa-moma.desktop"

  # fix desktop file
  sed -i "s|Exec=.*|Exec=wuwa-moma|" \
    "$pkgdir/usr/share/applications/wuwa-moma.desktop"

  sed -i "s|Icon=.*|Icon=wuwa-moma|" \
    "$pkgdir/usr/share/applications/wuwa-moma.desktop"

  # install icon
  install -Dm644 usr/share/icons/hicolor/512x512/apps/wuwa_mod_manager.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/wuwa-moma.png"
}