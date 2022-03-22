# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=mfem
pkgver=4.4
pkgrel=1
pkgdesc="Lightweight, general, scalable C++ library for finite element methods"
arch=('x86_64')
url='https://github.com/mfem/mfem'
license=('BSD')
depends=('gcc-libs')
makedepends=('cmake')
provides=('libmfem.so=4.4.0-64')
changelog=CHANGELOG
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0325a57854d9268dfe3f8d9b03836eb01b00a966d93162e6249857e9fab9c61f')

build() {
	cmake \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DBUILD_SHARED_LIBS=true \
		-Wno-dev \
		-B build \
		-S "$pkgname-$pkgver"
	make -C build
}

package() {
	make -C build install DESTDIR="$pkgdir/"
	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README NOTICE -t "$pkgdir/usr/share/doc/$pkgname/"
}
