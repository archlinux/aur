# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=ntvcm
pkgver=0.0.20250904
pkgrel=1
pkgdesc='NT Virtual CP/M Machine, emulates CP/M running on an 8080/Z80 processor'
_commit=f421ba4035aed6f485be9e5e64666bfd9156afc8
url=https://github.com/davidly/ntvcm
arch=(x86_64)
license=(CC0-1.0)
depends=(glibc)
makedepends=(git)
source=("$pkgname-$pkgver::git+$url#commit=$_commit")
b2sums=('894a5513831a2f8f0a44d4b110676d2619fbacd42003a99957ed1d1d3a8822c53ffe6911ce5fe32b46c8ecc7b45d8da04400532c509bc39a1854313b2f8f8e91')

build() {
	cd "$pkgname-$pkgver"
	"${CXX:-c++}" $CXXFLAGS $LDFLAGS -I. -o ntvcm ntvcm.cxx x80.cxx
}

check() {
	cd "$pkgname-$pkgver"

	./ntvcm -8 tests/8080EX1.COM
	./ntvcm -8 tests/8080PRE.COM
	./ntvcm -8 tests/TST8080.COM
	./ntvcm -8 tests/TEST.COM
	./ntvcm -8 tests/CPUTEST.COM
	./ntvcm tests/CPUTEST.COM

	./ntvcm z80test/zexall.com
	./ntvcm z80test/zexdoc.com
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 -t "$pkgdir/usr/bin" ntvcm
}
