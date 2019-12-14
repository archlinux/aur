# Maintainer:
# Contributor: Mark Wagie <yochanan dot marqos at gmail dot com>
# Contributor: Alexander F. Rødseth <xyproto at archlinux dot org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Ionut Biru <ibiru at archlinux dot org>
# Contributor: Roman Kyrylych <Roman dot Kyrylych at gmail dot com>
# Contributor: William Rea <sillywilly at gmail dot com>

pkgname=gnome-schedule
pkgver=2.3.0
pkgrel=2
pkgdesc="Graphical interface to crontab and at for GNOME"
arch=('any')
url="http://gnome-schedule.sourceforge.net"
license=('GPL')
depends=('python2-gconf' 'at' 'cron')
makedepends=('gnome-common' 'gnome-doc-utils')
optdepends=('gnome-terminal: run tasks manually')
source=("https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('9992acb12ed52ec781d623fbc33c5dd3428ef863956fb8088b937c401cbe7b5a')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	python2 -m compileall "$pkgdir"/usr/share/gnome-schedule/
}
