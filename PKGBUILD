# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=vpkedit
pkgname=$_pkgname-bin
pkgdesc="A tool to work with VPK files (binary release)"
pkgver=3.4.2
pkgrel=1
arch=('x86_64')
url="https://github.com/craftablescience/VPKEdit"
license=('MIT')
conflicts=($_pkgname)
provides=($_pkgname)
source=("$pkgver-$_pkgname.zip::$url/releases/download/v$pkgver/VPKEdit-Linux-Standalone-gcc-Release.zip"
        "$url/raw/v$pkgver/src/gui/res/icon.png")
sha256sums=('5d2aaa397eb5bde4f9cd61e8292c751db50a8bf5a63138905d14e52869f9cdc7'
            'SKIP')

prepare() {
  # Create a shortcut
  echo -e "[Desktop Entry]\n\
Version=$pkgver\n\
Name=VPKEdit\n\
Comment=A tool to read, preview, and write to VPK files.\n\
Exec=$_pkgname %U\n\
Icon=$_pkgname\n\
Terminal=false\n\
Type=Application\n\
Categories=Qt;Development;Utility;" > desktop
  mv desktop $_pkgname.desktop
}

package() {
# Create folders
  mkdir -p "$pkgdir/opt/VPKEdit" "$pkgdir/usr/bin"
# Install
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm644 $_pkgname.desktop -t "$pkgdir/usr/share/applications"
  ln -s /opt/VPKEdit/$_pkgname "$pkgdir/usr/bin/$_pkgname"
  rm $pkgver-$_pkgname.zip icon.png LICENSE CREDITS.md $_pkgname.desktop
  mv * "$pkgdir/opt/VPKEdit"
  chmod +x "$pkgdir/opt/VPKEdit/$_pkgname"
}
