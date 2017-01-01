# Maintainer: Karel Louwagie <karel@louwagie.net>

pkgname=stratoflare
pkgver=0.1.0
pkgrel=1
pkgdesc="Cloudflare API proxy."
arch=('i686'
	'x86_64'
	'armv6h'
	'armv7h')
makedepends=('go'
	'make')
url='https://gitlab.com/sorcix/stratoflare'
source=("$pkgname.tar.gz::https://gitlab.com/sorcix/stratoflare/repository/archive.tar.gz?ref=v0.1.0"
	"$pkgname.install"
	"$pkgname.sysusers"
	"$pkgname.service")
install="$pkgname.install"

build() {
	mv $srcdir/stratoflare-v$pkgver* $srcdir/$pkgname
	export GOPATH=$srcdir/$pkgname
	cd $GOPATH
	make build
}

package() {
	install -D -m 0644 $srcdir/$pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
	install -D -m 0644 $srcdir/$pkgname.sysusers $pkgdir/usr/lib/sysusers.d/$pkgname.conf
	install -D -m 0600 $srcdir/$pkgname/stratoflare.cfg.example $pkgdir/etc/stratoflare.cfg.example
	install -D -m 0755 $srcdir/$pkgname/$pkgname $pkgdir/usr/bin/$pkgname
}

sha512sums=('800d97afbff9fe878f230ca4e36a158a346cb1e20af8e94cfdd4d92fa9bc4a79b84bc14014362818f423d894e8bc1508cfba086cc65001cb602e929116a4a3d1'
            '0c350abc79a7b4e4815b196d9a0fb0e90d92d708c9b62c1d3a7865ee675761a62408b464f549830e5af7cbe188497295d6c4c9003471735ba6e99d34dbf3a0f3'
            'b913cddee27bb05c392e14eb67c9d006936980f876dd72e67841619976b7dcd01df373ce8af9d0021f19fcc2859ddc9526cffa50f8d190a19bdb2ad58374695b'
            '73868c350382936fc08e6a3e03d050a5175684006bd041b385b7bceb3a9ca87677a8cce273c7a29f150ca7f3305ae78b6a33030f88e6dcd86eae59348d53b750')
