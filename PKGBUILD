# $Id$
# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>

pkgname=libebur128
pkgver=1.0.2
pkgrel=2
pkgdesc="A library that implements the EBU R 128 standard for loudness normalisation."
arch=('i686' 'x86_64')
url="https://github.com/jiixyj/libebur128"
license=('MIT')
depends=('speex')
makedepends=('cmake')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/jiixyj/$pkgname/archive/v$pkgver.tar.gz"
    "0001-Add-DHAVE_STDINT_H-to-fix-build-with-recent-speexdsp.patch"
)
sha256sums=('9b334d31a26b47ba6740bb7bbee7a24461d535f426b1ed42368c187e27c08323'
            '8218929ec91ea966e3c52f3c4244db21660fccf2004a6e32d65cc9c2e7ae3e8b')

prepare() {
	cd "$pkgname-$pkgver"

    patch -Np1 -i "$srcdir/0001-Add-DHAVE_STDINT_H-to-fix-build-with-recent-speexdsp.patch"

	[[ -d build ]] && rm -rf build
	mkdir build
}

build() {
	cd "$pkgname-$pkgver"

	cd build
	cmake .. \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
	make
}

package() {
	cd "$pkgname-$pkgver"
	
	cd build
	make DESTDIR="$pkgdir" install
}

