# Maintainer: vmalloc support@cyborg-connect.de
pkgname=clockspeed
pkgver=0.62
pkgrel=00
pkgdesc="clockspeed uses a hardware tick counter to compensate for a persistently fast or slow system clock"
arch=('i686' 'x86_64')
url="http://cr.yp.to/clockspeed.html"
license=('GPL')
depends=()
makedepends=()
source=("http://cr.yp.to/clockspeed/$pkgname-$pkgver.tar.gz"
'clockspeed-0.62.errno.patch')

sha512sums=('4dae1cfcfc5eb1398fd5a7642ff91987487d9828d314d4bd9f93cdadc60fe99889280a7f8e9192674ed19d246bd4a450ad32b1258e450216111c488074db7978'
            'a57a95257c8cbecee25cf6b36db331d19259eb99106d72a1422a414ba5a34c62962f0be62b257ebbfab40f8f83065b0cee63d1222c0e9b908730f9f3bc21999a')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	
	patch -p1 < ../clockspeed-0.62.errno.patch || return 1
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make || return 1
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	# install clockspeed
	install -m 755 -D sntpclock "$pkgdir/usr/bin/sntpclock"
	install -m 755 -D clockspeed "$pkgdir/usr/bin/clockspeed"
	install -m 755 -D clockview "$pkgdir/usr/bin/clockview"
	install -m 755 -D clockadd "$pkgdir/usr/bin/clockadd"
	install -m 755 -D taiclock "$pkgdir/usr/bin/taiclock"
	install -m 755 -D taiclockd "$pkgdir/usr/bin/taiclockd"
}
