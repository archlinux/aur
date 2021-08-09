# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=mfem
pkgver=4.3
pkgrel=1
pkgdesc="Lightweight, general, scalable C++ library for finite element methods"
arch=('x86_64')
url="https://mfem.org"
license=('BSD')
makedepends=('cmake')
changelog=CHANGELOG
source=("$pkgname-$pkgver.tar.gz::https://github.com/mfem/mfem/archive/v$pkgver.tar.gz")
sha256sums=('b5f2b33997caeed653c0fadd353cdce596754f2883b5860ef7e5a370e33eeafd')

build() {
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev \
		-B build \
		-S "$pkgname-$pkgver"
	make -C build
}

package() {
	make -C build install DESTDIR="$pkgdir/"
	cd "$pkgname-$pkgver"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README NOTICE -t "$pkgdir/usr/share/doc/$pkgname/"
}
