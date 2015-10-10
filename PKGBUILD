# Maintainer: Sebastian Neef <aur AT gehaxelt DOT in>
pkgname=ssocks
pkgver=0.0.14
pkgrel=1
pkgdesc="Contains a socks5 server, a reverse socks server and client, a netcat like tool and a socks5 relay."
arch=("x86_64" "i686")
url=""
license=('MIT')
depends=("glibc")
source=("http://netassist.dl.sourceforge.net/project/ssocks/ssocks-$pkgver.tar.gz")
md5sums=("42d87189271c23fc2174f83331044101")

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix="/usr/" --sysconfdir="/etc/"
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	mv "COPYING" "$pkgdir/usr/share/licenses/$pkgname/"
}
