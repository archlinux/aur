# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=kitch
pkgname=$_pkgname-bin
pkgdesc="The development branch of the itchio app (binary release)"
pkgver=26.1.2
pkgrel=2
arch=('x86_64')
url="https://itchio.itch.io/kitch"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname" "itch" "itch-setup")
source=("$_pkgname-$pkgver-linux-amd64.zip::https://broth.itch.ovh/$_pkgname/linux-amd64/$pkgver/archive/default"
        "LICENSE-$_pkgname::https://github.com/itchio/itch/raw/master/LICENSE")
sha256sums=('e962fb202d4dbf4c287e634bef6c5c191b884544cf24e025675df450d9dc2bda'
            'SKIP')

prepare() {
  # Create a shortcut
  echo "Categories=Game;" >> desktop
  sed -i '1 i\Comment=The development branch of the itchio app' desktop
  sed -i '1 i\StartupWMClass=kitch' desktop
  sed -i '1 i\Icon=kitch' desktop
  sed -i '1 i\Type=Application' desktop
  sed -i '1 i\Terminal=false' desktop
  sed -i '1 i\Exec=/opt/kitch/kitch %U' desktop
  sed -i '1 i\Name=kitch' desktop
  sed -i '1 i\[Desktop Entry]' desktop
  mv desktop $_pkgname.desktop
}

package() {
  # Create folders
  mkdir -p "$pkgdir/opt/$_pkgname" "$pkgdir/usr/bin"
  # Install
  install -Dm644 $_pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 LICENSE-$_pkgname "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 resources/app/src/static/images/tray/$_pkgname.png -t "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  install -Dm644 resources/app/src/static/images/window/kitch/icon.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
  install -Dm644 resources/app/src/static/images/window/kitch/icon-32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/$_pkgname.png"
  rm LICENSE-$_pkgname $_pkgname.desktop $_pkgname-$pkgver-linux-amd64.zip
  mv "$srcdir"/* "$pkgdir/opt/$_pkgname"
  ln -s /opt/$_pkgname/$_pkgname "$pkgdir/usr/bin"
}
