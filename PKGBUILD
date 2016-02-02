# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hp-health
pkgver=10.20_1723.27
_pkgver64=10.20_1723.26
pkgrel=1
pkgdesc="HP System Health Application and Command line Utility Package"
arch=(i686 x86_64)
url="http://downloads.linux.hp.com/SDR/downloads/mcp"
depends=(bash dmidecode pciutils)
groups=(hpproliant)
license=("CUSTOM")

source=(hpasmd.service
        hpasrd.service)
source_i686=("http://downloads.linux.hpe.com/SDR/repo/mcp/centos/6/i686/current/$pkgname-${pkgver//_/-}.rhel6.i686.rpm")
# source_x86_64=("http://downloads.linux.hpe.com/SDR/repo/mcp/centos/7/x86_64/current/$pkgname-${pkgver//_/-}.rhel7.x86_64.rpm")
source_x86_64=("http://downloads.linux.hpe.com/SDR/repo/mcp/centos/7/x86_64/current/$pkgname-${_pkgver64//_/-}.rhel7.x86_64.rpm")

sha256sums=('6db979dcc293bb4e73593e19e467c45a3f66bdab7df395ccb63218926aeb6050'
            '78913f4ab8230eafad68d9bfc69075ce81ccf06e7b77864f4a0aa73226d2cc90')
sha256sums_i686=('e0b3792532157acc0c9677fd7bef051add7e617fed5c1382c15ae9e8f7c398ff')
sha256sums_x86_64=('14b656d1d2549611df6230bbb4f8926517b63e90676d55ba2bcac38683e03cb1')

package() {
	cd "$srcdir"
	cp -a opt usr var "$pkgdir"
	cp -a sbin "$pkgdir"/usr/bin

	cd "$pkgdir"/usr
	[ -d lib64 ] && mv lib64 lib

	install -Dm644 "$srcdir"/hpasmd.service "$pkgdir"/usr/lib/systemd/system/hpasmd.service
	install -Dm644 "$srcdir"/hpasrd.service "$pkgdir"/usr/lib/systemd/system/hpasrd.service
}
