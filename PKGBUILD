# Maintainer: begin-theadventure <begin-thecontact.ncncb@dralias.com>

_pkgname=flightcore
pkgname=$_pkgname-bin
pkgver=1.10.2
pkgrel=2
pkgdesc="A Northstar installer, updater, and mod-manager (AppImage release)"
arch=('x86_64')
url="https://github.com/R2NorthstarTools/FlightCore"
license=('MIT')
depends=('fuse2' 'zlib')
makedepends=('util-linux')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')
source=("$url/releases/download/v$pkgver/flight-core_${pkgver}_amd64.AppImage")
sha256sums=('75629c4c83d9748e1b6b2814568596789254ec9df0a29e5463a70de19bf85e05')

prepare() {
  [[ -d squashfs-root ]] && rm -rf squashfs-root
  chmod 755 flight-core_${pkgver}_amd64.AppImage
  ./flight-core_${pkgver}_amd64.AppImage --appimage-extract
  sed -i 's|^Exec=.*|Exec=flightcore|' squashfs-root/flight-core.desktop
  sed -i 's|^Icon=.*|Icon=flightcore|' squashfs-root/flight-core.desktop
}

package() {
  install -Dm644 squashfs-root/usr/share/icons/hicolor/256x256@2/apps/flight-core.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm644 squashfs-root/flight-core.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm755 flight-core_${pkgver}_amd64.AppImage "$pkgdir/usr/bin/$_pkgname"
}
