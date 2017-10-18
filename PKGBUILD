# Maintainer: m1kc (Max Musatov) <m1kc@yandex.ru>

pkgname="track-o-bot-git"
_pkgname="track-o-bot"
pkgver=0.2.1.r518.ga6d45ab
pkgrel=1
pkgdesc="Track-o-Bot is a small, easy-to-use app which automatically tracks your Hearthstone matches. No packet sniffing, just parsing HS logs."
arch=('i686' 'x86_64')
url="https://github.com/BOSSoNe0013/track-o-bot"
license=('LGPL')
groups=()
depends=("qt5-base" "hicolor-icon-theme" "qt5-x11extras")
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="track-o-bot.install"
source=('git://github.com/BOSSoNe0013/track-o-bot.git')
noextract=()
md5sums=('SKIP')

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
