# Maintainer: Christopher Hamilton <marker5a@gmail.com>

pkgname=qmodbus-git
_gitname=qmodbus
pkgver=r174.8ab168f
pkgrel=1
pkgdesc='QModBus is a free Qt-based implementation of a ModBus master application. A graphical user interface allows easy communication with ModBus slaves over serial line interface. QModBus also includes a bus monitor for examining all traffic on the bus.'
arch=('x86_64' 'i686')
url='http://qmodbus.sourceforge.net/'

license=('GPLv2')
depends=('qt5-base')
makedepends=('git')
optdepends=()
provides=()
conflicts=()

source=('git+https://github.com/ed-chemnitz/qmodbus.git')
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

	
	mkdir -p "$pkgdir/usr/share/qmodbus/build/"
	mkdir -p "$pkgdir/usr/share/qmodbus/data/"
	mkdir -p "$pkgdir/usr/share/applications"
	mkdir -p "$pkgdir/usr/bin"
	
	cp "$srcdir/$_gitname/qmodbus" "$pkgdir/usr/share/qmodbus/build/qmodbus"	
	cp "$srcdir/$_gitname/data/logo.png" "$pkgdir/usr/share/qmodbus/data/"
	cp "$srcdir/$_gitname/qmodbus.desktop" "$pkgdir/usr/share/applications/"
	
	ln -s "/usr/share/qmodbus/build/qmodbus" "$pkgdir/usr/bin/qmodbus"
	
}

# vim:set ts=2 sw=2 et:
