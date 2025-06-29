# Contributor: m1kc (Max Musatov) <m1kc@yandex.ru>

pkgname="track-o-bot-git"
_pkgname="track-o-bot"
pkgver=0.2.1.r521.gc470cd8
pkgrel=1
pkgdesc="The friendly Hearthstone Tracker (Linux port)"
arch=('x86_64')
url="https://github.com/BOSSoNe0013/track-o-bot"
license=('LGPL-2.1-or-later')
depends=("qt5-base" "hicolor-icon-theme" "qt5-x11extras")
makedepends=('git')
install="track-o-bot.install"
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$_pkgname"
	sed -i 's/Game;/Game;Games;/g' "assets/track-o-bot.desktop"
}

build() {
	cd "$srcdir/$_pkgname"
	qmake PREFIX=/usr
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir" INSTALL_ROOT="$pkgdir" install
}
