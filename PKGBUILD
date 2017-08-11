# Maintainer: GoldIMax <goldimax1688「gmail」com>
pkgname=project-lemon
pkgver=1.2
pkgrel=1
pkgdesc="A tiny judging environment for OI contest"
arch=('i686' 'x86_64')
url="https://code.google.com/p/project-lemon/"
license=('GPL')
depends=('qt4')
makedepends=('git')

prepare() {
	cd "$srcdir"
	if [ -e Project_lemon ]; then
		cd Project_lemon
		git pull
	else
		git clone https://github.com/Sojiv/Project_lemon
	fi
}

build() {
	cd "$srcdir/Project_lemon"
	qmake-qt4 lemon.pro
	make
}

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/share/applications"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/apps"
	cp "$startdir/project-lemon.desktop" "$pkgdir/usr/share/applications/"
	cd Project_lemon
	cp lemon "$pkgdir/usr/bin/project-lemon"
	cp icon.png "$pkgdir/usr/share/icons/hicolor/scalable/apps/project-lemon.png"
}
