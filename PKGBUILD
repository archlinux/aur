# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname=esekeyd
pkgver=1.2.7
pkgrel=1
pkgdesc="ESE Key Daemon is a multimedia keyboard daemon for Linux."
arch=('any')
url="http://freecode.com/projects/esekeyd"
license=('GPL')
depends=('glibc')
install=$pkgname.install
DLAGENTS='http::/usr/bin/curl -fLC - --user-agent Firefox --retry 3 --retry-delay 3 -o %o %u'
source=("http://www.burghardt.pl/files/$pkgname-$pkgver.tar.gz"
	"$pkgname.install"
	"$pkgname.service")
sha256sums=('58bdac994be805d9c11b21065427c8f53684d38a1b44bb02b175fc4ee594cc56'
            '6ca6d9e9cbb8c32c3ec686dda35728c1901c166a78e4d5e0a74a812fa7de119e'
            '6e3ab29acc42dea73da9184c1d553975ddadf92957d8e448762630ac4b16282f')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 examples/example.conf $pkgdir/etc/$pkgname.conf
	install -Dm644 $srcdir/$pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
}
