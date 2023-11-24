# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=converternow
pkgname=$_pkgname-bin
pkgver=4.1.0
pkgrel=3
pkgdesc="The Unit Converter app: easy, immediate and multi-platform (binary release)"
url="https://github.com/ferraridamiano/ConverterNOW"
arch=('x86_64')
license=('GPL3')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=($_pkgname-$pkgver.tar.gz::"$url/releases/download/v$pkgver/$_pkgname-linux-x64.tar.gz")
sha256sums=('5fe8235d5d89b020e792eed4b8d5b7234ceec97cce3cff832b708366a0020d1e')

prepare() {
# Create a shortcut
  echo -e "[Desktop Entry]\n\
Name=Converter NOW\n\
Exec=$_pkgname %U\n\
Icon=$_pkgname\n\
Terminal=false\n\
Type=Application\n\
StartupWMClass=Converter NOW\n\
Comment=The Unit Converter app: easy, immediate and multi-platform" > desktop
  mv desktop $_pkgname.desktop
}

package() {
# Create folders
  mkdir -p "$pkgdir/opt/ConverterNOW" "$pkgdir/usr/bin"
# Install
  mv data lib $_pkgname "$pkgdir/opt/ConverterNOW"
  ln -s /opt/ConverterNOW/$_pkgname "$pkgdir/usr/bin"
  install -Dm644 $_pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 "$pkgdir/opt/ConverterNOW/data/flutter_assets/assets/app_icons/logo.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
}
