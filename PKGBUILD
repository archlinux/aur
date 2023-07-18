# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=vpktool
pkgname=$_pkgname-bin
pkgdesc="A tool to read and extract data from VPK files (binary release)"
pkgver=2.1.2
pkgrel=3
arch=('x86_64')
url="https://github.com/craftablescience/VPKTool"
license=('MIT')
depends=('qt6-base')
conflicts=($_pkgname)
provides=($_pkgname)
source=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/VPKTool-Linux-Standalone-gcc-Release.zip"
        "https://raw.githubusercontent.com/craftablescience/VPKTool/v$pkgver/src/gui/res/icon.png")
sha256sums=('a9bf2616b1464e507b1ec7f611445cee8c58270b991cb6bd46ec3e20d7d4a435'
            'SKIP')

prepare() {
  # Create a shortcut
  echo "Categories=Utility;" > desktop
  sed -i '1 i\Comment=A tool to read and extract data from VPK files' desktop
  sed -i '1 i\StartupWMClass=VPKTool' desktop
  sed -i '1 i\Icon=vpktool' desktop
  sed -i '1 i\Type=Application' desktop
  sed -i '1 i\Terminal=false' desktop
  sed -i '1 i\Exec=vpktool %U' desktop
  sed -i '1 i\Name=VPKTool' desktop
  sed -i '1 i\[Desktop Entry]' desktop
  mv desktop $_pkgname.desktop
}

package() {
  # Create a folder
  mkdir -p "$pkgdir/usr/bin"
  # Install
  install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm644 $_pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm755 libvtflib.so vpktool -t "$pkgdir/opt/VPKTool"
  ln -s /opt/VPKTool/$_pkgname -t "$pkgdir/usr/bin"
}
