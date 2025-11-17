# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=ntvcm
pkgver=0.0.20251117
pkgrel=1
pkgdesc='NT Virtual CP/M Machine, emulates CP/M running on an 8080/Z80 processor'
_commit=4f4a38483ece42a5c3437883bf917c4be536f2ec
url=https://github.com/davidly/ntvcm
arch=(x86_64)
license=(CC0-1.0)
depends=(glibc)
makedepends=(git)
source=("$pkgname-$pkgver::git+$url#commit=$_commit")
b2sums=('89433a4adb1257b108ef0cfe4108c3aa57be5c0c5b80bf6ba275c732fc5ce46f086afbb9732af5c3179491a947d750ef5279e6c18ba100e822a56207d8ecd51a')

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
