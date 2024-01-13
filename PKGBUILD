# Maintainer: éclairevoyant

pkgname=leed
pkgver=1.14.0
pkgrel=1
pkgdesc="Minimalist, fast, non-intrusive RSS/ATOM aggregator"
arch=(any)
url="https://github.com/LeedRSS/Leed"
license=(AGPL3)
depends=(mysql php)
optdepends=('php-apache: to use the Apache web server')
backup=('etc/webapps/leed/apache.conf')
options=(emptydirs)
source=("$pkgname-$pkgver.zip::https://github.com/LeedRSS/Leed/archive/v$pkgver.zip"
        leed.apache.conf
        leed.perm.sh)
install=$pkgname.install
b2sums=('da122921acc1e3c57d0b9029eb16fb9f44b2b070cd2c679637358795dee0a102bae7dfbda395bb14cf6d5f92cc8125c25f1d162f985a1aa14a21c60fe747ff6b'
        '0a75a9817392042c75c05c158671f413292de55fb91bbb662561cb9fd23e7a63f85b1639d7548dda53fdc01398f96079a02f358d39113d3f78f9a7177a2f0a0c'
        '71934656ebb52b68898c555618684267346b8d823f578645aea582ddde59947f340408a1616a98fab56fa8e211a54b1958179568a8e1cf45c95af6bd5d3abbb8')

package() {
	install -vdm750 "$pkgdir/usr/share/webapps/"
	cp -ar Leed-$pkgver "$pkgdir/usr/share/webapps/leed"

	find "${pkgdir}/usr/share/webapps/leed/" -type f -exec chmod 0640 {} \;
	find "${pkgdir}/usr/share/webapps/leed/" -type d -exec chmod 0750 {} \;

	install -vDm755 leed.perm.sh "$pkgdir/usr/bin/set-leed-perm"
	install -vDm644 leed.apache.conf "$pkgdir/etc/webapps/leed/apache.conf"
}
