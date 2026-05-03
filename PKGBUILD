# Maintainer: Ayman Lyesri <ayman.lyesri.99@gmail.com>

pkgname=wuwa-moma-bin
pkgver=0.1.40
pkgrel=1
pkgdesc="Wuthering Waves Mod Manager (Tauri)"
arch=('x86_64')
url="https://github.com/AymanLyesri/wuwa-mod-manager"
license=('MIT')
depends=('gtk3' 'libappindicator-gtk3')
provides=('wuwa-moma')
conflicts=('wuwa-moma')

source=("wuwa-moma-bin-0.1.40.AppImage::https://github.com/AymanLyesri/wuwa-mod-manager/releases/download/app-v0.1.40/WuwaMoMa_0.1.40_amd64.AppImage")
sha256sums=('18cbaf77e66061a558603d2b1d83291269fa631f821265b22dfa26938c80ff85')

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