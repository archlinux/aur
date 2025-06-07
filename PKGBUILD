# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=converternow
pkgname=$_pkgname-bin
pkgver=4.3.3
pkgrel=1
pkgdesc="The Unit Converter app: easy, immediate and multi-platform (binary release)"
url="https://github.com/ferraridamiano/ConverterNOW"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=('gtk3')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=($_pkgname-linux-x64-$pkgver.tar.gz::"$url/releases/download/v$pkgver/$_pkgname-linux-x86_64.tar.gz")
sha256sums=('8fcd721ef592f30ff701747cee963578e956fcc08913ac6333bd15607dca20f9')

prepare() {
# Create a shortcut
  echo -e "[Desktop Entry]\n\
Name=Converter NOW\n\
Comment=The Unit Converter app: easy, immediate and multi-platform\n\
Exec=$_pkgname %U\n\
Icon=$_pkgname\n\
Terminal=false\n\
Type=Application\n\
StartupWMClass=Converter NOW" > $_pkgname.desktop
}

package() {
# Create directories
  mkdir -p "$pkgdir/opt/ConverterNOW" "$pkgdir/usr/bin"
# Install
  install -Dm644 $_pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 data/flutter_assets/assets/logo.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
  mv data lib $_pkgname "$pkgdir/opt/ConverterNOW"
  ln -s /opt/ConverterNOW/$_pkgname "$pkgdir/usr/bin"
}
