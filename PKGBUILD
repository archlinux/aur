# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=flightcore-bin
pkgver=2.19.0
pkgrel=3
pkgdesc="A Northstar installer, updater, and mod-manager (binary release)"
url="https://github.com/R2NorthstarTools/FlightCore"
license=('MIT')
arch=('x86_64')
depends=('webkit2gtk')
makedepends=('fuse2')
provides=("flightcore")
conflicts=("flightcore")
_appimage=flight-core_${pkgver}_amd64.AppImage
source=("$url/releases/download/v$pkgver/$_appimage"
        "$url/archive/refs/heads/main.zip")
sha256sums=('a1fb78511b75c06bf5df3dd799254e3f2826ad5f5df7c1c2af746382d57f83f0'
            'SKIP')

prepare() {
# Extract the AppImage
  chmod +x "./$_appimage"
  "./$_appimage" --appimage-extract
# Edit the shortcut
  mv squashfs-root/usr/share/applications/flight-core.desktop flightcore.desktop
  sed -i "s/flight-core/flightcore/g" flightcore.desktop
}

package() {
  install -Dm644 flightcore.desktop -t "$pkgdir/usr/share/applications"
  install -Dm755 squashfs-root/usr/bin/flight-core "$pkgdir/usr/bin/flightcore"
  cd FlightCore-main
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/flightcore"
  cd src-tauri
  install -Dm644 icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
  install -Dm644 icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
  install -Dm644 icons/128x128@2x.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm644 icons/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
}
