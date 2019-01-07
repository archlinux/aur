# Maintainer: pappy <pappy _AT_ a s c e l i o n _DOT_ com>

pkgname=rbldnsd
pkgver=0.998b
pkgrel=5
pkgdesc="Small Daemon for DNSBLs"
arch=(x86_64)
url=https://rbldnsd.io
license=(GPL)
source=($pkgname-$pkgver.tar.gz::https://github.com/spamhaus/rbldnsd/archive/$pkgver.tar.gz
		$pkgname.sh
		$pkgname.sysusers
		$pkgname.tmpfiles
		$pkgname.service
		$pkgname.opts
		$pkgname.ip4set
		)
backup=(etc/conf.d/$pkgname)
install=$pkgname.install
sha256sums=('7f6abacb561bad4ec6014e75d44c4cce48d67ed13b7a5cd61bcc6566b3c0b8c7'
            '3804cb9d9e94b66126541197afa69d10609a14a8c2f5100ca3f016ce8eec82ea'
            '8e671965d7a80ffab0279f4b08a751d596ade0b02abdb8b860e39aabfb677734'
            '19a540e4619334fd8c6604adc3337f51c95089f87f64ebb5c2b0760dc571ea49'
            'f17616ba4220550f933578371b9a11018ec993879fb2813215a65de84c3dce1f'
            '56fb9b9290d089b773622b401fc552dec467a5649d47552bec85f80e6ab69664'
            '80e32fa4746acf8f3d00f735eef4c1584979ac59e899bee22f6e07a9b2ba9b06')

prepare()
{
	cd $srcdir/$pkgname-$pkgver
	./configure
}

build()
{
	cd $srcdir/$pkgname-$pkgver
	make
}

package()
{

	pushd $srcdir/$pkgname-$pkgver
	install -Dm755 $pkgname $pkgdir/usr/lib/$pkgname/$pkgname
	install -Dm644 $pkgname.8 $pkgdir/usr/share/man/man8/$pkgname.8
	popd

	install -Dm755 $pkgname.sh $pkgdir/usr/bin/$pkgname
	install -Dm644 $pkgname.sysusers $pkgdir/usr/lib/sysusers.d/$pkgname.conf
	install -Dm644 $pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
	install -Dm644 $pkgname.tmpfiles $pkgdir/usr/lib/tmpfiles.d/$pkgname.conf
	install -Dm644 $pkgname.opts $pkgdir/etc/conf.d/$pkgname

	install -Dm644 $pkgname.ip4set $pkgdir/usr/lib/$pkgname/local.txt.ip4set

	gzip -9 $pkgdir/usr/share/man/man8/$pkgname.8
}

