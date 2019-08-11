# Maintainer: Nobody <nobody@anonymous.invalid>
pkgname=linux-genuine-advantage
pkgver=1.0.0
pkgrel=1
pkgdesc="This program makes sure that a given copy of Linux is Genuine"
arch=('any')
url="http://www.linuxgenuineadvantage.org"
license=('GPL')
depends=("perl"
	"perl-cgi"
	"perl-io-socket-inet6")
source=("$url/downloads/$pkgname-$pkgver.tar.gz"
        "modern-linux.patch"
	"no-install.patch"
	"lga.service")
md5sums=("SKIP"
	"SKIP"
	"SKIP"
	"SKIP")

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/modern-linux.patch"
	patch -p1 -i "$srcdir/no-install.patch"
}

package() {
	cd "$pkgname-$pkgver"
	mkdir $pkgdir/usr
	mkdir $pkgdir/usr/bin
	cp $srcdir/$pkgname-$pkgver/$pkgname $pkgdir/usr/bin
	mkdir $pkgdir/usr/lib
	mkdir $pkgdir/usr/lib/systemd
	mkdir $pkgdir/usr/lib/systemd/system
	cp $srcdir/lga.service $pkgdir/usr/lib/systemd/system
}
