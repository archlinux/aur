# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Co-Maintainer: Ash <xash at riseup d0t net>

pkgname=flightcore-bin
pkgver=3.1.1
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
sha256sums=('07500da5a44246181a304a576a95d46e382dece22ff57963b02115a1d7bb46d1'
            '5d0983681d88657946f4b6c43682f0ac76553a611b8f2af58372fe348e23341e')

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
