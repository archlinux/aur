# Maintainer: Matthew McGinn <mamcgi@gmail.com>
pkgname=ptpd-git
_pkgname=ptpd
pkgrel=1
pkgver=235e9b4
pkgdesc="The PTP daemon (PTPd) implements the Precision Time protocol (PTP) as defined by the relevant IEEE 1588 standard. PTP Version 2 implements IEEE-1588-2008. PTP was developed to provide very precise time coordination of LAN connected computers."
arch=('any')
url="https://github.com/ptpd/ptpd"
license=('BSD')
conflicts=('ptpd2')
depends=('libpcap')
optdepends=('net-snmp')
provides=('ptpd2')
source=("git+https://github.com/${_pkgname}/${_pkgname}")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
        git describe --always
}

build() {
	cd "$_pkgname"
        autoreconf -vi
	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

check() {
	cd "$_pkgname"
	make -k check
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" install
        install -D -m644 COPYRIGHT "${pkgdir}/usr/share/licenses/$pkgname/COPYRIGHT"
}
