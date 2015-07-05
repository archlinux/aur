# Contributor: Camille Moncelier <pix@devlife.org>
# Update: henning mueller <henning@orgizm.net>

pkgname=thcrut
pkgver=1.2.5
pkgrel=3
pkgdesc="Network discovery and OS Fingerprinting tool"
url="http://thc.org/thc-rut/"
source=(http://freeworld.thc.org/releases/$pkgname-$pkgver.tar.gz)
md5sums=(dd942ad5db7701725038721981077585)
depends=(pcre libpcap)
arch=(i686 x86_64)
license=(custom)

build() {
	wget http://freeworld.thc.org/thc-rut/thcrut-os-fingerprints
	wget http://www.insecure.org/nmap/data/nmap-os-fingerprints

	cd $srcdir/$pkgname-$pkgver

	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$pkgdir install

	install -m644 $srcdir/thcrut-os-fingerprints $pkgdir/usr/share/thcrut/thcrut-os-fingerprints
	install -m644 $srcdir/nmap-os-fingerprints $pkgdir/usr/share/thcrut/nmap-os-fingerprints	

	mkdir -p $pkgdir/usr/share/licenses/thcrut
	install -m644 $srcdir/$pkgname-$pkgver/LICENSE $pkgdir/usr/share/licenses/thcrut
}
