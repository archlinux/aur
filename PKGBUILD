# Maintainer: raf <raf at raf dot org>
pkgname=broadband-usage
pkgver=0.2
pkgrel=1
pkgdesc="Home broadband usage meter for SNMP-enabled modem/routers"
arch=("any")
url=https://raf.org/broadband-usage/
license=("GPL")
depends=("perl>=5.6" net-snmp)
source=("https://github.com/raforg/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("6a1b215c0d86259ee8fb250b11c436eae0b9429fe4b617465987e798d033c0c7")

check()
{
	cd "$pkgname-$pkgver"
	make test
}

package()
{
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir"/var/log/broadband
	mkdir -p "$pkgdir"/usr/bin
	mkdir -p "$pkgdir"/usr/share/man/man1
	make prefix="$pkgdir"/usr logdir="$pkgdir"/var/log/broadband mandir="$pkgdir"/usr/share/man/man1 install
}

