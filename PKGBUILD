# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=aptik-gtk
pkgver=18.8
pkgrel=4
pkgdesc="GTK Frontend for Aptik System Migration Utility"
arch=('i686' 'x86_64')
url="https://github.com/teejee2008/aptik-gtk"
license=('GPL3')
depends=('aptik' 'glib2' 'gtk3' 'libgee')
makedepends=('git' 'vala' 'vte3')
source=("${pkgname}_v${pkgver}.tgz::https://github.com/teejee2008/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('1b5a0fc547ceafdc7bbf5005fa9b43b8fdac2ecb060bf004560f75b5ea84ff70')

prepare() {
	cd "$pkgname-$pkgver/src/Gtk"
	sed -i 's/term.feed_child(cmd, -1);/term.feed_child(cmd.to_utf8());/g' TermBox.vala
}

build() {
	cd "${pkgname}-${pkgver}"
	make all
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
}
