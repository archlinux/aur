# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=converternow
pkgname=$_pkgname-bin
pkgdesc="The Unit Converter app: easy, immediate and multi-platform (binary release)"
pkgver=4.1.0
pkgrel=1
arch=('x86_64')
url="https://github.com/ferraridamiano/ConverterNOW"
license=('GPL3')
conflicts=($_pkgname)
provides=($_pkgname)
source=($_pkgname-$pkgver.tar.gz::"$url/releases/download/v$pkgver/$_pkgname-linux-x64.tar.gz")
sha256sums=('5fe8235d5d89b020e792eed4b8d5b7234ceec97cce3cff832b708366a0020d1e')

prepare() {
  # "Create a shortcut"
  echo "Comment=The Unit Converter app: easy, immediate and multi-platform" > desktop
  sed -i '1 i\StartupWMClass=Converter NOW' desktop
  sed -i '1 i\Icon=/opt/ConverterNOW/data/flutter_assets/assets/app_icons/logo.png' desktop
  sed -i '1 i\Type=Application' desktop
  sed -i '1 i\Terminal=false' desktop
  sed -i '1 i\Exec=converternow %U' desktop
  sed -i '1 i\Name=Converter NOW' desktop
  sed -i '1 i\[Desktop Entry]' desktop
  mv desktop $_pkgname.desktop
}

package() {
  # Create folders
  mkdir -p ConverterNOW
  mkdir -p $pkgdir/opt
  mkdir -p $pkgdir/usr/bin
  # Install
  install -Dm644 $_pkgname.desktop -t "$pkgdir/usr/share/applications"
  cp -r data lib $_pkgname ConverterNOW
  cp -r ConverterNOW "$pkgdir/opt/ConverterNOW"
  ln -s /opt/ConverterNOW/$_pkgname "$pkgdir/usr/bin/$_pkgname"
}
