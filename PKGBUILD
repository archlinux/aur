# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=converternow
pkgname=$_pkgname-bin
pkgver=4.4.0
pkgrel=2
pkgdesc="The Unit Converter app: easy, immediate and multi-platform (binary release)"
url="https://github.com/ferraridamiano/ConverterNOW"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=('gtk3')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=($_pkgname-linux-x64-$pkgver.tar.gz::"$url/releases/download/v$pkgver/$_pkgname-linux-x86_64.tar.gz")
sha256sums=('b7e0d7dc194182a36362f08a6771465c50c07195d0696e0c6ec11adf5a69054f')

prepare() {
# Create a shortcut
  echo -e "[Desktop Entry]\n\
Name=Converter NOW\n\
Comment=The Unit Converter app: easy, immediate and multi-platform\n\
Exec=$_pkgname %U\n\
Icon=$_pkgname\n\
Terminal=false\n\
Type=Application\n\
StartupWMClass=Converter NOW" > io.github.ferraridamiano.ConverterNOW.desktop
}

package() {
# Create directories
  mkdir -p "$pkgdir/opt/ConverterNOW" "$pkgdir/usr/bin"
# Install
  install -Dm644 io.github.ferraridamiano.ConverterNOW.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 data/flutter_assets/assets/logo.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
  mv data lib $_pkgname "$pkgdir/opt/ConverterNOW"
  ln -s /opt/ConverterNOW/$_pkgname "$pkgdir/usr/bin"
}
