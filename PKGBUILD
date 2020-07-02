# Maintainer: Gregory Dushkin (GregTheMadMonk) <yagreg7@gmail.com>
pkgname=noaftodo-git
pkgver=1.4.0
pkgrel=2
pkgdesc="An ncurses TODO manager that No-One-Asked-For."
arch=(x86_64 i686)
url="https://github.com/gregthemadmonk/noaftodo.git"
license=('GPL3')
depends=(ncurses)
makedepends=(git make sed)
optdepends=('libnotify: provides notify-send commandused in default config' 
		'dunst: possible notification daemon for notify-send to work')
source=("git+$url#branch=pkg")
changelog=CHANGELOG
md5sums=('SKIP')

build() {
	cd noaftodo
	make
}

package() {
	cd noaftodo
	PKGROOT="$pkgdir" make install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 noaftodo.conf.template -t "$pkgdir/etc/$pkgname"
	install -Dm644 scripts/* -t "$pkgdir/etc/$pkgname/scripts"
}
