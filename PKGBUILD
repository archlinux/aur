# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=mdlshit
pkgname=$_pkgname-bin
pkgver=2.3.2
pkgrel=2
pkgdesc="source engine .mdl v49 -> v53 converter (binary release)"
arch=('x86_64')
url="https://github.com/headassbtw/mdlshit"
license=('GPL2')
makedepends=('imagemagick')
conflicts=($_pkgname)
provides=($_pkgname)
source=("$_pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/${_pkgname}_linux_x64.tar.gz"
        "https://raw.githubusercontent.com/headassbtw/mdlshit/$pkgver/product.ico"
        "https://raw.githubusercontent.com/headassbtw/mdlshit/$pkgver/README.md"
        "https://raw.githubusercontent.com/headassbtw/mdlshit/$pkgver/LICENSE")
sha256sums=('b01aa6f2d2f96982399faff8f177a96df3538ce75771aa9445c03b519cb8ecb0'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  # "Create a shortcut"
  echo "Categories=Game;" >> desktop
  sed -i '1 i\Comment=source engine .mdl v49 -> v53 converter' desktop
  sed -i '1 i\StartupWMClass=mdlshit' desktop
  sed -i '1 i\Icon=mdlshit' desktop
  sed -i '1 i\Type=Application' desktop
  sed -i '1 i\Terminal=false' desktop
  sed -i '1 i\Exec=mdlshit %U' desktop
  sed -i '1 i\Name=mdlshit' desktop
  sed -i '1 i\[Desktop Entry]' desktop
  mv desktop $pkgname.desktop

  convert product.ico $_pkgname.png
}

package() {
  install -Dm644 $_pkgname.png -t "$pkgdir/usr/share/pixmaps"
  install -Dm644 $pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm755 $_pkgname -t "$pkgdir/usr/bin"
}
