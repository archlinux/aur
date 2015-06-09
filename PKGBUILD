# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hp-health
pkgver=9.50_1628
pkgrel=3
pkgdesc="HP System Health Application and Command line Utility Package"
arch=(i686 x86_64)
url="http://downloads.linux.hp.com/SDR/downloads/mcp"
depends=(bash dmidecode pciutils)
groups=(hpproliant)
license=("CUSTOM")

sha256sums=('8dc1247dded64d620d72b02384997d3e6bf582233fa766ee9bd35c7ef17ecaed'
            '6db979dcc293bb4e73593e19e467c45a3f66bdab7df395ccb63218926aeb6050'
            '78913f4ab8230eafad68d9bfc69075ce81ccf06e7b77864f4a0aa73226d2cc90')
rpmrel=32
if [ "$CARCH" = "i686" ]; then
	rpmrel=33
	sha256sums[0]='7ee31c9843e5e8b06d42143c5b5f167fef5c62e5f22b759bd2da7caf84ce48ca'
fi

source=(http://downloads.linux.hp.com/SDR/downloads/mcp/centos/6/$CARCH/current/$pkgname-${pkgver//_/-}.$rpmrel.rhel6.$CARCH.rpm
        hpasmd.service
        hpasrd.service)

package() {
	cd "$srcdir"
	cp -a opt usr var "$pkgdir"
	cp -a sbin "$pkgdir"/usr/bin

	cd "$pkgdir"/usr
	[ -d lib64 ] && mv lib64 lib

	install -Dm644 "$srcdir"/hpasmd.service "$pkgdir"/usr/lib/systemd/system/hpasmd.service
	install -Dm644 "$srcdir"/hpasrd.service "$pkgdir"/usr/lib/systemd/system/hpasrd.service
}
