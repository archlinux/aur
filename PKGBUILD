# Maintainer: msb <msb@tuta.com>
pkgname=kamakura
pkgver=4.0
pkgrel=1
#description
pkgdesc="A simple and functional code editor"
arch=('x86_64')
url="https://github.com/msbCyricTohoku/Kamakura--"
#SPDX license identifier
license=('GPL-3.0-or-later')

#hicolor-icon-theme dependency
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('qt5-tools' 'git')

source=("$pkgname::git+$url.git")
sha512sums=('SKIP')

build() {
  cd "$pkgname"
  qmake-qt5 Kamakura.pro PREFIX=/usr
  make
}

package() {
  cd "$pkgname"

  #install the main executable
  install -Dm755 Kamakura "$pkgdir/usr/bin/$pkgname"

  #install license and documentation
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  #install the application icon
  install -Dm644 src/resources/kamakuraicon.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"

  #create and install the .desktop file
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Name=Kamakura
Comment=A simple and functional code editor
Exec=kamakura
Icon=kamakura
Type=Application
Terminal=false
Categories=Development;TextEditor;Utility;
EOF
}