# Maintainer: Matt Wilder <me@partcyb.org>

pkgname=sockstat
pkgdesc='FreeBSD utility to display information about open sockets.'
pkgver=0.4.1
pkgrel=1
arch=('any')
license=('GPL2+')
url='https://packages.debian.org/sid/sockstat'
source=("http://deb.debian.org/debian/pool/main/s/sockstat/sockstat_${pkgver}.orig.tar.gz")
sha256sums=('ac85ceca3b54074f5d3f4b26b63bd79d7f002087c283a6737508396c1b0fb185')

build() {
	cd "${srcdir}/sockstat-${pkgver}"
	make
}

package() {
   mkdir -p "${pkgdir}/usr/bin"
   mkdir -p "${pkgdir}/usr/share/man/man1"
	cd "${srcdir}/sockstat-${pkgver}"
   make DESTDIR="$pkgdir" install
   gzip -c sockstat.1 > sockstat.1.gz
   install -m 644 -o root sockstat.1.gz "${pkgdir}/usr/share/man/man1"
}
