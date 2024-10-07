# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=ntvcm
pkgver=0.0.20241007
pkgrel=1
pkgdesc='NT Virtual CP/M Machine, emulates CP/M running on an 8080/Z80 processor'
_commit=9a5ec82c7f621c436c459da00734c6ed6e4b2f7a
url=https://github.com/davidly/ntvcm
arch=(x86_64)
license=(CC0-1.0)
depends=(glibc)
makedepends=(git)
source=("$pkgname-$pkgver::git+$url#commit=$_commit")
b2sums=('91b223f80d086482704c0f206bc1f605508162719cffda7de99bd509e68e36bc8f86be38e68d41ee9fac40aa28547d37b4caeb1844595ab0602c37ca340bcc3f')

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
