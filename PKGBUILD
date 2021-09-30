# Submitter: kpcyrd <git@rxv.cc>
# Maintainer: Elmar Klausmeier <Elmar.Klausmeier@gmail.com>

pkgbase=open-cobol
pkgname=('open-cobol')
pkgver=3.1.2
pkgrel=2
pkgdesc="COBOL compiler"
url="https://sourceforge.net/projects/gnucobol/files/gnucobol/"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
source=("$pkgname-$pkgver.tar.xz::https://sourceforge.net/projects/gnucobol/files/gnucobol/3.1/gnucobol-${pkgver}.tar.xz/download"
	"https://www.itl.nist.gov/div897/ctg/suites/newcob.val.Z")
license=("GPL")
depends=("db" "gmp" "json-c" "libxml2")
checkdepends=("perl")
makedepends=("gcc")
sha256sums=('597005d71fd7d65b90cbe42bbfecd5a9ec0445388639404662e70d53ddf22574'
	'1e9a92ddbd5d730cbeb764281f7810c22b18e0163985b09675393ab22bbd61f9')


build() {
	cd gnucobol-${pkgver}
	./configure --prefix=/usr --infodir=/usr/share/info --disable-hardening
	make
}


# Suggested by Simon Sobisch, 22-Sep-2021
check() {
	cd gnucobol-${pkgver}
	make check
	cp ../../newcob.val.Z tests/cobol85/  &&  make test
}


package() {
	cd gnucobol-"$pkgver"
	make DESTDIR="$pkgdir" install
}


