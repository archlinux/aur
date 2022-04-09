# Maintainer: bitwave <aur [aT] oomlu {d.0t} de>
pkgname=notepadnext
pkgver=0.4.9
pkgrel=1
pkgdesc="A cross-platform, reimplementation of Notepad++"
arch=("i686" "x86_64")
url="https://github.com/dail8859/NotepadNext"
license=('GPL3')
depends=('qt5-base')
source=("git+https://github.com/dail8859/NotepadNext.git")

prepare() {
  cd "NotepadNext"
  gendesk -n -f --pkgname=notepadnext --name=NotepadNext --exec=NotepadNext --icon=NotepadNext.svg
}

build() {
  cd "NotepadNext"
  git submodule update --init
  mkdir -p build
  cd build
  qmake-qt5 ../src/NotepadNext.pro
  make
}

package() {
  cd "NotepadNext"
  
  install -d "$pkgdir/usr/bin"
  install -m755 -D "build/NotepadNext/NotepadNext" "$pkgdir/usr/bin"

  install -d "$pkgdir/usr/share/pixmaps"
  install -m644 -D "icon/NotepadNext.svg" "$pkgdir/usr/share/pixmaps"

  install -d "$pkgdir/usr/share/applications"
  install -m644 -D "notepadnext.desktop" "$pkgdir/usr/share/applications"
}

sha256sums=('SKIP')
