# Maintainer: osfans <waxaca@163.com>
_pkgname=opencc-gui
pkgname=$_pkgname-git
pkgver=r36.f10480b
pkgrel=1
pkgdesc="Gui in Qt5 of Library for Open Chinese Convert"
arch=('i686' 'x86_64')
url="http://code.google.com/p/opencc/"
license=('Apache License 2.0')
depends=('opencc' 'qt5-base')
makedepends=('git' 'qt5-tools')
optdepends=('uchardet-git')
source=('opencc-gui::git+https://github.com/BYVoid/opencc-gui.git')
md5sums=('SKIP')

pkgver() {
	cd $srcdir/$_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $srcdir/$_pkgname
	./build.sh
}

package() {
	cd $srcdir/$_pkgname
	mkdir -p ${pkgdir}/usr/share/$_pkgname
	cp build/$_pkgname build/*.qm ${pkgdir}/usr/share/$_pkgname
	mkdir -p ${pkgdir}/usr/bin
	ln -s /usr/share/$_pkgname/$_pkgname ${pkgdir}/usr/bin
}
