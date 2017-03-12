pkgname=parprouted
pkgver=0.7
pkgrel=3
pkgdesc="daemon for transparent IP (Layer 3) proxy ARP bridging"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://freecode.com/projects/parprouted"
license=('GPL2')
depends=('iproute')
source=("http://www.hazard.maks.net/parprouted/parprouted-$pkgver.tar.gz"
	"000-routecmd.diff"
	"parprouted.conf"
	"parprouted.service")

sha512sums=('c55d50dc7fc90ca108989a47a4b6f02509c0f3c72d13c9cc81cde27f56cce3dba4af74724a372395aae00c390222c9d53a604b61d6bd5af907124345b1b5e64f'
            'a6281bd022f6b1d0d10f6b973b47c3fee2093428cd1835ba78ed4a6acd6210ea086fe42af3f254f5bdd60574e12ab4e2d0d235c56737e49e6d1ffc725d046517'
            'fcb0e60618cf3d42baf175a5b318de6ef8d271f0993d5e77492698141740d2dd8fdfe8c093105ef48d5ecbb36c674027ab80d838222ef73e3a526f91b86ab64e'
            'd6d15aaf44f8726aa27f7685ab76d9b5a7faa6655dec508909d4bf7420da5ab525bc738b85b1282bac8dbe9d11d73bf2a10b43f77c570a6db54bdb7f5688e6d3')

build() {
	cd parprouted-$pkgver
	patch -p1 < ../000-routecmd.diff
	make
}

package() {
	install -Dm0755 "parprouted-$pkgver"/parprouted $pkgdir/usr/bin/parprouted
	install -Dm0644 "parprouted-$pkgver"/parprouted.8 $pkgdir/usr/share/man/man8/parprouted.8
	install -Dm0644 "$startdir"/parprouted.service "$pkgdir"/usr/lib/systemd/system/parprouted.service
	install -Dm0644 "$startdir"/parprouted.conf "$pkgdir"/etc/conf.d/parprouted
}
