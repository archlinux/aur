# Maintainer: Gökberk Yaltıraklı <webdosusb at gmail dot com>
pkgname=notes
pkgver=0.8.0
pkgrel=1
pkgdesc="Note taking application, write down your thoughts."
arch=('i686' 'x86_64')
url="https://github.com/nuttyartist/notes"
license=('MPL')
depends=('qt5-base')
makedepends=('qtcreator')
provides=('notes')
conflicts=('notes')
source=($pkgname-$pkgver.tar.gz::"https://github.com/nuttyartist/notes/archive/v$pkgver.tar.gz")
md5sums=('b642fdada866bc2cdd24bf834abbaa68')

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
Icon=/usr/share/pixmaps/${pkgname}_icon.png
EOF

  mkdir build
  cd build
  qmake ../src/Notes.pro
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 bin/Notes $pkgdir/usr/bin/$pkgname
  install -Dm644 src/images/notes_icon.png $pkgdir/usr/share/pixmaps/${pkgname}_icon.png
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
