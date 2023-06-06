# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=vpktool
pkgname=$_pkgname-bin
pkgdesc="A tool to read and extract data from VPK files (binary release)"
pkgver=2.1.2
pkgrel=1
arch=('x86_64')
url="https://github.com/craftablescience/VPKTool"
license=('MIT')
depends=('qt6-base')
conflicts=($_pkgname)
provides=($_pkgname)
_zip=VPKTool-Linux-Standalone-gcc-Release.zip
_desktop=$_pkgname.desktop
_url2=https://raw.githubusercontent.com/craftablescience/VPKTool/v$pkgver
source=("$pkgver-$_zip::$url/releases/download/v$pkgver/$_zip"
        "$_url2/src/gui/res/icon.png")
sha256sums=('a9bf2616b1464e507b1ec7f611445cee8c58270b991cb6bd46ec3e20d7d4a435'
            'SKIP')

prepare() {
  # Create a shortcut
  echo "Categories=Utility;" > $_desktop
  sed -i '1 i\Comment=A tool to read and extract data from VPK files' $_desktop
  sed -i '1 i\StartupWMClass=VPKTool' $_desktop
  sed -i '1 i\Icon=vpktool' $_desktop
  sed -i '1 i\Type=Application' $_desktop
  sed -i '1 i\Terminal=false' $_desktop
  sed -i '1 i\Exec=vpktool %U' $_desktop
  sed -i '1 i\Name=VPKTool' $_desktop
  sed -i '1 i\[Desktop Entry]' $_desktop
}

package() {
  # Create a folder
  mkdir -p "$pkgdir/usr/bin"
  # Install
  install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm644 $_desktop -t "$pkgdir/usr/share/applications"
  install -Dm755 libvtflib.so vpktool -t "$pkgdir/opt/VPKTool"
  ln -s $pkgdir/opt/VPKTool/$_pkgname -t "$pkgdir/usr/bin"
}
