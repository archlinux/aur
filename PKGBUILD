# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=mdlshit
pkgname=$_pkgname-bin
pkgver=2.3.2
pkgrel=1
pkgdesc="source engine .mdl v49 -> v53 converter (binary release)"
arch=('x86_64')
url="https://github.com/headassbtw/mdlshit"
license=('GPL2')
makedepends=('imagemagick')
conflicts=($_pkgname)
provides=($_pkgname)
_desktop=$_pkgname.desktop
_url2=https://raw.githubusercontent.com/headassbtw/mdlshit/c5f2c6c3cb259e051a42b76cbeb2fa501cda2af9
source=("$url/releases/download/$pkgver/${_pkgname}_linux_x64.tar.gz"
        "$_url2/product.ico"
        "$_url2/README.md"
        "$_url2/LICENSE")
sha256sums=('b01aa6f2d2f96982399faff8f177a96df3538ce75771aa9445c03b519cb8ecb0'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  # "Create a shortcut"
  echo "Categories=Game;" >> $_desktop
  sed -i '1 i\Comment=source engine .mdl v49 -> v53 converter ' $_desktop
  sed -i '1 i\StartupWMClass=mdlshit' $_desktop
  sed -i '1 i\Icon=mdlshit' $_desktop
  sed -i '1 i\Type=Application' $_desktop
  sed -i '1 i\Terminal=false' $_desktop
  sed -i '1 i\Exec=mdlshit %U' $_desktop
  sed -i '1 i\Name=mdlshit' $_desktop
  sed -i '1 i\[Desktop Entry]' $_desktop
  mkdir -p desktop
  mv $_desktop desktop

  convert product.ico $_pkgname.png
}

package() {
  install -Dm644 $_pkgname.png -t "$pkgdir/usr/share/pixmaps"
  install -Dm644 desktop/$_desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm755 $_pkgname -t "$pkgdir/usr/bin"
}
