# Maintainer: osfans <waxaca@163.com>
_pkgname=opencc-gui
pkgname=$_pkgname-git
pkgver=r38.47b0e26
pkgrel=2
pkgdesc="Gui in Qt5 of Library for Open Chinese Convert"
arch=('i686' 'x86_64')
url="http://code.google.com/p/opencc/"
license=('Apache License 2.0')
depends=('opencc' 'qt5-base')
makedepends=('git' 'qt5-tools')
optdepends=('uchardet')
source=('opencc-gui::git+https://github.com/BYVoid/opencc-gui.git')
md5sums=('SKIP')

pkgver() {
	cd $srcdir/$_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $srcdir/$_pkgname
	sed -i "s/0.0.0//" src/charsetdetector.cpp
	sed -i "s/1.0.0//" src/converter.cpp
	./build.sh
}

package() {
	cd $srcdir/$_pkgname
	mkdir -p ${pkgdir}/usr/share/$_pkgname
	cp build/$_pkgname build/*.qm ${pkgdir}/usr/share/$_pkgname
	mkdir -p ${pkgdir}/usr/bin
	ln -s /usr/share/$_pkgname/$_pkgname ${pkgdir}/usr/bin
}
