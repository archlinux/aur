# Submitter: kpcyrd <git@rxv.cc>
# Maintainer: Elmar Klausmeier <Elmar.Klausmeier@gmail.com>

pkgbase=open-cobol
pkgname=('open-cobol')
pkgver=3.2.1
cobolver=3.2
pkgrel=4
pkgdesc="COBOL compiler"
url="https://www.gnu.org/software/gnucobol/"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
source=("$pkgname-$pkgver.tar.xz::https://sourceforge.net/projects/gnucobol/files/gnucobol/3.2/gnucobol-${cobolver}.tar.xz/download"
	"https://eklausmeier.goip.de/pdf/newcob.val.Z"
	"common.c.patch")
license=("GPL")
depends=("gcc" "db" "gmp" "json-c" "libxml2")
checkdepends=("perl")
makedepends=("gcc")
sha256sums=('3bb48af46ced4779facf41fdc2ee60e4ccb86eaa99d010b36685315df39c2ee2'
            '1e9a92ddbd5d730cbeb764281f7810c22b18e0163985b09675393ab22bbd61f9'
            'e2041e6ac94a70670cc4e12e60d41b793dd836bad58e6e8cf7278e3ba36c1921')


build() {
	cd gnucobol-${cobolver}
	./configure --prefix=/usr --infodir=/usr/share/info --disable-hardening
	patch libcob/common.c ../../common.c.patch
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


