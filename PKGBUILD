# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=cryptocam-companion
pkgname=$_pkgname-bin
pkgdesc="A tool to decrypt files created by Cryptocam (binary release)"
pkgver=0.2.3
pkgrel=1
arch=('x86_64')
url="https://gitlab.com/cryptocam/cryptocam-companion"
license=('GPL3')
depends=('ffmpeg' 'qt5-quickcontrols')
conflicts=($_pkgname)
provides=($_pkgname)
source=("$pkgver-$_pkgname::$url/-/jobs/1246114286/artifacts/raw/cryptocam-qt"
        "$url/-/raw/master/cryptocam-companion.svg")
sha256sums=('70884febf79cd0ca8abe906217b4f8726539975fa6ab260653222ec6aa4e6f45'
           'SKIP')

prepare() {
  # Create a shortcut
  echo "Comment=A tool to decrypt files created by Cryptocam" > desktop
  sed -i '1 i\Categories=Utility;' desktop
  sed -i '1 i\Terminal=false' desktop
  sed -i '1 i\Type=Application' desktop
  sed -i '1 i\Icon=cryptocam-companion' desktop
  sed -i '1 i\Exec=cryptocam-companion' desktop
  sed -i '1 i\Name=Cryptocam Companion' desktop
  sed -i '1 i\[Desktop Entry]' desktop
  mv desktop $_pkgname.desktop
}

package() {
  install -Dm644 $_pkgname.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm644 $_pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm755 $pkgver-$_pkgname "$pkgdir/usr/bin/$_pkgname"
}
