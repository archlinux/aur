# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=vpkedit-bin
pkgver=3.7.0
pkgrel=1
pkgdesc="A tool to work with VPK files (binary release)"
url="https://github.com/craftablescience/VPKEdit"
arch=('x86_64')
license=('MIT')
provides=("vpkedit")
conflicts=("vpkedit")
source=("vpkedit-$pkgver.zip::$url/releases/download/v$pkgver/VPKEdit-Linux-Standalone-gcc-Release.zip"
        "$url/raw/main/src/gui/res/icon.png")
sha256sums=('081dcefdce1578780153ce3ffe521332b4dfbc40e4401964f7598cfe4a6167c1'
            'SKIP')

prepare() {
# Create a shortcut
  echo -e "[Desktop Entry]\n\
Version=$pkgver\n\
Name=VPKEdit\n\
Comment=A tool to read, preview, and write to VPK files.\n\
Exec=vpkedit %U\n\
Icon=vpkedit\n\
Terminal=false\n\
Type=Application\n\
Categories=Qt;Development;Utility;" > desktop
  mv desktop vpkedit.desktop
}

package() {
# Create folders
  mkdir -p "$pkgdir/opt/VPKEdit" "$pkgdir/usr/bin"
# Install
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/vpkedit"
  install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/vpkedit.png"
  install -Dm644 vpkedit.desktop -t "$pkgdir/usr/share/applications"
  ln -s /opt/VPKEdit/vpkedit -t "$pkgdir/usr/bin"
  rm vpkedit-$pkgver.zip icon.png LICENSE CREDITS.md vpkedit.desktop
  mv * "$pkgdir/opt/VPKEdit"
  chmod +x "$pkgdir/opt/VPKEdit/vpkedit"
}
