pkgname=wire
pkgver=20130907
pkgrel=1
pkgdesc="The InWorldz WHIP distributed asset server"
arch=(i686 x86_64)
url="http://wired.read-write.fr/"
license=("BSD")
source=("http://downloads.sourceforge.net/wired2/$pkgname.tar.gz")
depends=(openssl readline ncurses libxml2)
sha1sums=('0283064642cbc8587d39d4df4d61fe784f5c3bab')

build() {
	cd $pkgname
	./configure --prefix=/usr
	make
}

package() {
	cd $pkgname
	install -Dm755 run/wire "$pkgdir/opt/wired/wire"
	install -m644 run/wired.xml "$pkgdir/opt/wired/"
	mkdir -p "$pkgdir/usr/bin"
	ln -s /opt/wired/wire "$pkgdir/usr/bin/wire"
	install -Dm644 man/wire.1 "$pkgdir/usr/share/man/man1/wire.1"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
