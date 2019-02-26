# Maintainer: Christopher Hamilton <marker5a@gmail.com>

pkgname=easyterm
_gitname=easyterm
pkgver=r106.aa52d8d
pkgrel=1
pkgdesc='Serial Port Terminal Emulator'
arch=('x86_64' 'i686')
url='https://github.com/marker5a/EasyTerm'

license=('GPLv3')
depends=()
makedepends=('git' 'qt5-serialport' 'qt5-base')
optdepends=()
provides=(easyterm)
replaces=(easyterm)
conflicts=()

source=('easyterm::git+https://github.com/marker5a/EasyTerm.git')
md5sums=('SKIP')
pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"

  qmake-qt5 .
  make
}

package() {
	
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/48x48/apps"
	mkdir -p "$pkgdir/usr/share/applications"
	
	cp "$srcdir/$_gitname/release/EasyTerm" "$pkgdir/usr/bin"
	cp "$srcdir/$_gitname/resources/easyterm.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps"
	cp "$srcdir/$_gitname/easyterm.desktop" "$pkgdir/usr/share/applications/"
	
}

# vim:set ts=2 sw=2 et:
