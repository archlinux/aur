# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=crossover-overlay
pkgname=$_pkgname-bin
pkgver=3.1.5
pkgrel=3
pkgdesc="Adjustable Crosshair Overlay for any screen (binary release)"
arch=('x86_64' 'i686')
url="https://github.com/lacymorrow/crossover"
license=('CCPL:by-nc-sa4')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libappindicator-gtk3' 'libevent'
         'libnotify' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy')
conflicts=($_pkgname)
provides=($_pkgname)
_desktop=crossoverlay.desktop
source_x86_64=("$url/releases/download/v$pkgver/CrossOver-$pkgver-x86_64.rpm")
source_i686=("$url/releases/download/v$pkgver/CrossOver-$pkgver-i686.rpm ")
sha256sums_x86_64=('c38d1d52e9c27cd35117cfe5e278650c3c9b3144523a722681bfb638d3eaf33c')
sha256sums_i686=('57ca54841b1295663324457b55bd57dc681604a98a6f9c88998e3dfc8ddc3d78')

prepare() {
  # Edit the shortcut
  cd usr/share/applications
  mv crossover.desktop $_desktop
  chmod 644 $_desktop
  sed -i '3s/.*/Exec=crossoverlay --no-sandbox %U/' $_desktop
  sed -i '6s/.*/Icon=crossoverlay/' $_desktop
  chmod 664 $_desktop
}

package() {
  # Create folders
  mkdir -p $pkgdir/opt
  mkdir -p $pkgdir/usr/bin
  # Install
  install -Dm644 usr/share/applications/$_desktop "$pkgdir/usr/share/applications/$_desktop"
  install -Dm644 usr/share/icons/hicolor/0x0/apps/crossover.png "$pkgdir/usr/share/pixmaps/crossoverlay.png"
  cp -r opt/CrossOver "$pkgdir/opt/CrossOver"
  ln -s /opt/CrossOver/crossover "$pkgdir/usr/bin/crossoverlay"
}
