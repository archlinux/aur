# Maintainer: Diego Garcia <diego.garcia.cr at gmail dot com>
pkgname=pinta-appimage
pkgver=3.1.1_2
pkgrel=2
pkgdesc="Simple GTK Paint Program (Unofficial AppImage)"
arch=('x86_64')
url='https://github.com/pkgforge-dev/Pinta-AppImage'
license=('MIT')
depends=('dotnet-runtime' 'dotnet-host' 'libadwaita' 'hicolor-icon-theme' 'webp-pixbuf-loader')
conflicts=()
provides=('pinta')
noextract=("$pkgname-$pkgver.AppImage")
source=("$pkgname-$pkgver.AppImage::https://github.com/pkgforge-dev/Pinta-AppImage/releases/download/3.1.1-2%402026-03-22_1774172515/Pinta-3.1.1-2-anylinux-x86_64.AppImage")
sha256sums=('eb31e1c70c182d4813a1c4ed35912959fdd0f34e3ce76a1cc413ef4cd1678598')

prepare() {
  cd "$srcdir"
  chmod +x "$pkgname-$pkgver.AppImage"
  ./"$pkgname-$pkgver.AppImage" --appimage-extract
}

package() {
  cd "$srcdir/squashfs-root"

  sed -e 's|\$APPDIR|'$pkgdir'/opt/pinta|g' \
      -i ./bin/pinta

  install -dm755 "$pkgdir/opt/pinta"
  cp -dpr --no-preserve=ownership . "$pkgdir/opt/pinta/"

  install -Dm644 com.github.PintaProject.Pinta.desktop "$pkgdir/usr/share/applications/com.github.PintaProject.Pinta.desktop"
  install -Dm644 com.github.PintaProject.Pinta.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.github.PintaProject.Pinta.png"

  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/pinta/bin/pinta" "$pkgdir/usr/bin/pinta"
}
