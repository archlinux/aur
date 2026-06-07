# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=converternow
pkgname=$_pkgname-bin
pkgver=4.6.1
pkgrel=1
pkgdesc="The Unit Converter app: easy, immediate and multi-platform (binary release)"
url="https://github.com/ferraridamiano/ConverterNOW"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=('gtk3')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=($_pkgname-linux-x64-$pkgver.tar.gz::"$url/releases/download/v$pkgver/$_pkgname-linux-x86_64.tar.gz"
        logo.png::"$url/blob/v4.6.0/assets/logo.png?raw=true")
sha256sums=('e4d74823e4f1283789300afab290eb777e59c2a141b41d221121fb538499e86c'
            'e90c2c6ed0020191173eb18bbb3d42d42977570da787941b2b6bc7cb18fdea57')

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
  install -Dm644 logo.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
  install -Dm644 io.github.ferraridamiano.ConverterNOW.desktop -t "$pkgdir/usr/share/applications"
  mv data lib $_pkgname "$pkgdir/opt/ConverterNOW"
  ln -s /opt/ConverterNOW/$_pkgname "$pkgdir/usr/bin"
}
