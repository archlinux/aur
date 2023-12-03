# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=converternow
pkgname=$_pkgname-bin
pkgver=4.2.0
pkgrel=1
pkgdesc="The Unit Converter app: easy, immediate and multi-platform (binary release)"
url="https://github.com/ferraridamiano/ConverterNOW"
arch=('x86_64')
license=('GPL3')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=($_pkgname-linux-x64-$pkgver.tar.gz::"$url/releases/download/v$pkgver/$_pkgname-linux-x64.tar.gz")
sha256sums=('045c2a0ce2d794344a02e13a4d4f4b8c44ee13870b887b5783f5b49f102b0e89')

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
