# Maintainer: Astor Castelo <amcastelo[at]gatech[dot]edu>
# Contributor: Fabio Volpe <volpefabio@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=chipmunk
pkgver=6.1.1
pkgrel=1
pkgdesc="A high-performance 2D rigid body physics library"
arch=('i686' 'x86_64')
url="http://chipmunk-physics.net/"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
source=(http://files.slembcke.net/chipmunk/release/Chipmunk-${pkgver%%.*}.x/Chipmunk-$pkgver.tgz)

build() {
	cd "$srcdir/Chipmunk-$pkgver"
	sed -i '/MAKE_PROPERTIES_REF(cpShape, IsSensor);/d' include/chipmunk/chipmunk_ffi.h
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DBUILD_DEMOS=OFF -DCMAKE_C_FLAGS="-DCHIPMUNK_FFI" .
	make clean
	make
}

package() {
	cd "$srcdir/Chipmunk-$pkgver"
	install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	make DESTDIR="$pkgdir" install
}

sha256sums=('42de3a975b0cb534dd5be423e2c1f178b53533d1dba0962c554a5bc1a1493da6')
