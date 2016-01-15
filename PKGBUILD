pkgname=parprouted
pkgver=0.7
pkgrel=1
pkgdesc="proxy ARP IP bridging daemon"
arch=('i686' 'x86_64' 'armv6l' 'armv7h')
url="http://freecode.com/projects/parprouted"
license=('GPL2')
depends=('iproute')
source=("http://www.hazard.maks.net/parprouted/parprouted-$pkgver.tar.gz"
	"000-routecmd.diff")
md5sums=('570f5deaf09600df8f80f589de79ecdb'
         'c77e6b850b50a338cfc4f0c91f33b7f6')

build() {
	cd parprouted-$pkgver
	patch -p1 < ../000-routecmd.diff
	make CFLAGS+=' -DROUTE_CMD=\"/usr/bin/ip\"'
}

package() {
	cd parprouted-$pkgver
	install -Dm755 parprouted $pkgdir/usr/bin/parprouted
	install -Dm644 parprouted.8 $pkgdir/usr/share/man/man8/parprouted.8
}
