# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=alfae
pkgname=$_pkgname-bin
pkgver=1.4.1
pkgrel=2
pkgdesc="An Itch.io/Epic Games/GOG launcher that works through plugins (binary release)"
arch=('x86_64')
url="https://github.com/suchmememanyskill/Alfae"
license=('GPL3')
provides=($_pkgname)
conflicts=($_pkgname)
options=('!strip')
source=("$_pkgname-$pkgver.zip::$url/releases/download/$pkgver/Linux.zip"
        "$url/raw/$pkgver/Launcher/Assets/icon.png")
sha256sums=('33027a73c17561776e938f9b7c5ca83a8a3a0d3bf000e147dbe60b7d0996c4e9'
            'SKIP')

prepare() {
  # Create a shortcut
  echo "Categories=Game;" >> desktop
  sed -i '1 i\Comment=An Itch.io/Epic Games/GOG launcher that works through plugins' desktop
  sed -i '1 i\StartupWMClass=Alfae' desktop
  sed -i '1 i\Icon=alfae' desktop
  sed -i '1 i\Type=Application' desktop
  sed -i '1 i\Terminal=false' desktop
  sed -i '1 i\Exec=/opt/Alfae/Alfae %U' desktop
  sed -i '1 i\Name=Alfae' desktop
  sed -i '1 i\[Desktop Entry]' desktop
  mv desktop $_pkgname.desktop
}

package() {
  # Create folders
  mkdir -p "$pkgdir/opt/Alfae" "$pkgdir/usr/bin"
  # Install
  mv Release/* "$pkgdir/opt/Alfae"
  ln -s /opt/Alfae/Alfae $pkgdir/usr/bin/$_pkgname
  install -Dm644 icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
  install -Dm644 $_pkgname.desktop -t "$pkgdir/usr/share/applications"
}
