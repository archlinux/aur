# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=ntvcm
pkgver=0.0.20250219
pkgrel=1
pkgdesc='NT Virtual CP/M Machine, emulates CP/M running on an 8080/Z80 processor'
_commit=65b4029eff89126658c60d0558e8332810688186
url=https://github.com/davidly/ntvcm
arch=(x86_64)
license=(CC0-1.0)
depends=(glibc)
makedepends=(git)
source=("$pkgname-$pkgver::git+$url#commit=$_commit")
b2sums=('32067845a27a3ab42beb9f4bb9e223518d96f0630615ed653cc166470ee85385cf027c5ca2ba4c3e42a803599b965610a92303cfaac686b8eebe65858cbb042e')

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
