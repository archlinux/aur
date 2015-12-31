# Maintainer: Dan Johansen <strit83 at gmail dot com>

pkgname=arena-tracker
pkgver=3.26
pkgrel=3
pkgdesc="Tracks your Hearthstone Arena matches and cards"
arch=('i686' 'x86_64')
url="https://github.com/supertriodo/Arena-Tracker/"
license=('GPL')
depends=('qt5-base')
makedepends=('opencv')
provides=(arena-tracker)
conflicts=('arena-tracker' 'arena-tracker-git')
source=("arena-tracker.desktop")

prepare() {
	git clone https://github.com/supertriodo/Arena-Tracker.git
}

build() {
	cd "Arena-Tracker"
	qmake ArenaTracker.pro
	make
}


package() {
	install -dm755 $pkgdir/opt/$pkgname
	install -dm755 $pkgdir/usr/share/applications
	install -dm755 $pkgdir/usr/share/icons/
	install -d $pkgdir/usr/bin/
	install -m755 $srcdir/Arena-Tracker/ArenaTracker $pkgdir/opt/$pkgname/$pkgname
	install -m755 $srcdir/Arena-Tracker/ArenaTracker.ico $pkgdir/usr/share/icons/$pkgname.ico
	install -m755 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	cp -R $srcdir/Arena-Tracker/HSCards $pkgdir/opt/$pkgname/HSCards
	ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
	ln -s "/opt/$pkgname/HSCards/" "$pkgdir/usr/bin/"
	chmod 0777 "$pkgdir/opt/$pkgname/HSCards/"
}
md5sums=('30d6a980e82a37af04f56f3d39451fb0')
