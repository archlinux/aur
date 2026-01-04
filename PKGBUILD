# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Co-Maintainer: Ash <xash at riseup d0t net>

pkgname=flightcore-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="Installer/Updater/Launcher for Northstar (binary release)"
url="https://github.com/R2NorthstarTools/FlightCore"
license=('MIT')
arch=('x86_64')
depends=('webkit2gtk-4.1')
makedepends=('fuse2')
provides=("flightcore")
conflicts=("flightcore")
_appimage=FlightCore_${pkgver}_amd64.AppImage
source=("$url/releases/download/v$pkgver/$_appimage"
        "$url/archive/refs/tags/v$pkgver.zip")
sha256sums=('2b5ef86a6fb99dc4e262ab6abcf452b96b57b85ab19ee2c2bda4ee6752c8c13b'
            '4cde4b50e28127dea4c280e083c893e8de23c25c89982fc5e859ed994be60395')

prepare() {
# Extract the AppImage
  chmod +x "./$_appimage"
  "./$_appimage" --appimage-extract
}

package() {
  install -Dm644 squashfs-root/usr/share/applications/FlightCore.desktop -t "$pkgdir/usr/share/applications"
  install -Dm755 squashfs-root/usr/bin/flightcore -t "$pkgdir/usr/bin"
  cd FlightCore-$pkgver
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/flightcore"
  cd docs
  install -Dm644 ../README.md DEV-TOOLS.md DEVELOPMENT.md FAQ.md TROUBLESHOOTING.md\
  -t "$pkgdir/usr/share/doc/flightcore"
  _icdr=usr/share/icons/hicolor
  install -Dm644 assets/flightcore.svg -t "$pkgdir/$_icdr/scalable/apps"
  cd ../src-tauri/icons
  install -Dm644 32x32.png "$pkgdir/$_icdr/32x32/apps/flightcore.png"
  install -Dm644 128x128.png "$pkgdir/$_icdr/128x128/apps/flightcore.png"
  install -Dm644 128x128@2x.png "$pkgdir/$_icdr/256x256/apps/flightcore.png"
  install -Dm644 icon.png "$pkgdir/$_icdr/512x512/apps/flightcore.png"
}
