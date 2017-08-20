# Maintainer: Gökberk Yaltıraklı <webdosusb at gmail dot com>
pkgname=notes
pkgver=1.0.0
pkgrel=1
pkgdesc="Note taking application, write down your thoughts."
arch=('i686' 'x86_64')
url="https://github.com/nuttyartist/notes"
license=('MPL')
depends=('qt5-base')
makedepends=()
provides=('notes')
conflicts=('notes')
source=($pkgname-$pkgver.tar.gz::"https://github.com/nuttyartist/notes/archive/v$pkgver.tar.gz")
md5sums=('5731d46b15a3ed0666254bbfcb304f8e')

build() {
  cd "$pkgname-$pkgver"

  cat > $pkgname.desktop << EOF
[Desktop Entry]
Version=${pkgver}
Type=Application
Terminal=false
StartupNotify=true
Name=Notes
Comment=$pkgdesc
Categories=Utility;Application;
Exec=/usr/bin/${pkgname}
Icon=/usr/share/pixmaps/${pkgname}_icon.ico
EOF

  mkdir build
  cd build
  qmake ../src/Notes.pro
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build/notes $pkgdir/usr/bin/$pkgname
  install -Dm644 src/images/notes_icon.ico $pkgdir/usr/share/pixmaps/${pkgname}_icon.ico
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
