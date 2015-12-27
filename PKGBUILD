# Maintainer: Dan Johansen <strit83 at gmail dot com>

pkgname=arena-tracker
pkgver=3.26
pkgrel=2
#epoch=
pkgdesc="Tracks your Hearthstone Arena matches and cards"
arch=('i686' 'x86_64')
url="https://github.com/supertriodo/Arena-Tracker/"
license=('GPL')
#groups=()
depends=('qt5-base')
makedepends=('opencv' 'git')
#checkdepends=()
#optdepends=()
provides=(arena-tracker)
conflicts=('arena-tracker' 'arena-tracker-git')
#replaces=()
#backup=()
#options=()
#install=
#changelog=
source=("arena-tracker.desktop")
#noextract=()
#validpgpkeys=()

prepare() {
	git clone https://github.com/supertriodo/Arena-Tracker.git
}

build() {
	cd "Arena-Tracker"
	qmake ArenaTracker.pro
	make
}

#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

package() {
	install -dm755 $pkgdir/opt/$pkgname
	install -dm755 $pkgdir/usr/share/applications
	install -dm755 $pkgdir/usr/share/icons/
#	mkdir -p $pkgdir/opt/$pkgname/
#	mkdir -p $pkgdir/usr/share/applocations/
	install -d $pkgdir/usr/bin/
	install -m755 $srcdir/Arena-Tracker/ArenaTracker $pkgdir/opt/$pkgname/$pkgname
	install -m755 $srcdir/Arena-Tracker/ArenaTracker.ico $pkgdir/usr/share/icons/$pkgname.ico
	install -m755 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	cp -R $srcdir/Arena-Tracker/HSCards $pkgdir/opt/$pkgname/HSCards
	ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
	ln -s "/opt/$pkgname/HSCards/" "$pkgdir/usr/bin/"
}
md5sums=('d93e9cce645e5ed3d7067565b1163870')
