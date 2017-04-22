pkgname=chipmunk6
pkgver=6.2.2
pkgrel=2
pkgdesc="A high-performance 2D rigid body physics library"
arch=('i686' 'x86_64')
url="http://chipmunk-physics.net/"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
source=(http://files.slembcke.net/chipmunk/release/Chipmunk-${pkgver%%.*}.x/Chipmunk-$pkgver.tgz)
provides=(chipmunk)
replaces=(chipmunk)
conflicts=(chipmunk)

build() {
	cd "$srcdir/Chipmunk-$pkgver"
	#sed -i '/MAKE_PROPERTIES_REF(cpShape, IsSensor);/d' include/chipmunk/chipmunk_ffi.h
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DBUILD_DEMOS=OFF -DCMAKE_C_FLAGS="-DCHIPMUNK_FFI" .
	make clean
	make
}

package() {
	cd "$srcdir/Chipmunk-$pkgver"
	install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	make DESTDIR="$pkgdir" install
}

sha256sums=('790cf62d65820610ab352052bf2c76436600197337b1511be5f4423dc46ecdeb')
