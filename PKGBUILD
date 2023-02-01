# Submitter: kpcyrd <git@rxv.cc>
# Maintainer: Elmar Klausmeier <Elmar.Klausmeier@gmail.com>

pkgbase=open-cobol
pkgname=('open-cobol')
pkgver=3.2.1
cobolver=3.2-rc1
pkgrel=1
pkgdesc="COBOL compiler"
url="https://www.gnu.org/software/gnucobol/"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
source=("$pkgname-$pkgver.tar.xz::https://sourceforge.net/projects/gnucobol/files/gnucobol/3.2/gnucobol-${cobolver}.tar.xz/download"
	"https://www.itl.nist.gov/div897/ctg/suites/newcob.val.Z")
license=("GPL")
depends=("gcc" "db" "gmp" "json-c" "libxml2")
checkdepends=("perl")
makedepends=("gcc")
sha256sums=('026e01480fa91fae2b53c20bd118c133234fe1b07409e144fdbe5e17e5a8e6e7'
            '1e9a92ddbd5d730cbeb764281f7810c22b18e0163985b09675393ab22bbd61f9')


build() {
	cd gnucobol-${cobolver}
	./configure --prefix=/usr --infodir=/usr/share/info --disable-hardening
	make
}


# Suggested by Simon Sobisch, 22-Sep-2021
check() {
	cd gnucobol-${cobolver}
	make check
	cp ../../newcob.val.Z tests/cobol85/  &&  make test
}


package() {
	cd gnucobol-"$cobolver"
	make DESTDIR="$pkgdir" install
}


