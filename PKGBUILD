#Maintainer: Anton Karmanov <starcom24@gmail.com>
pkgname=phrasebooks
pkgver=1.0.2
pkgrel=1
epoch=
pkgdesc="English phrasebook that helps to learn language"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/phrasebooks/"
license=('GPL3')
groups=()
depends=('qt5-x11extras' 'hicolor-icon-theme' 'libxtst')
makedepends=('git' 'unzip' 'qt5-tools')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+git://git.code.sf.net/p/phrasebooks/code")
md5sums=('SKIP')
noextract=()
validpgpkeys=()

build() {
	cd $srcdir/*
	git checkout 139d700
	qmake
	make
	cd man
	gzip -f phrasebooks.1
	cd ../debian
	gzip -f changelog
}

package() {
	cd $pkgdir/
	mkdir -p usr/bin
	mkdir -p usr/share
	cd usr/share
	mkdir -p applications doc/phrasebooks icons/hicolor man/man1 phrasebooks/translations
	cd icons/hicolor
	cd $srcdir/*
	cp phrasebooks $pkgdir/usr/bin
	cp phrasebooks.desktop $pkgdir/usr/share/applications
	cp debian/changelog.gz debian/copyright $pkgdir/usr/share/doc/phrasebooks
	cp man/phrasebooks.1.gz $pkgdir/usr/share/man/man1
	cp -R translations $pkgdir/usr/share/phrasebooks/translations
	for _res in 16 24 32 48 64 72 96 128
	do
		mkdir -p $pkgdir/usr/share/icons/hicolor/${_res}x${_res}/apps
		cp icons/phrasebooks-${_res}.png $pkgdir/usr/share/icons/hicolor/${_res}x${_res}/apps/phrasebooks.png
	done
}
