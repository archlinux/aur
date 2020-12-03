# Maintainer: Gavin D. Howard <yzena.tech@gmail.com>
pkgname=bc-gh
pkgver=3.2.3
pkgrel=1
pkgdesc="Implementation of dc and POSIX bc with GNU extensions"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/gavinhoward/bc"
license=('BSD')
provides=('bc=1.07.1-3')
conflicts=('bc=1.07.1-3')
source=("$pkgname-$pkgver.tar.xz::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz"
        "$pkgname-$pkgver.tar.xz.sig::https://github.com/gavinhoward/bc/releases/download/$pkgver/bc-$pkgver.tar.xz.sig")
sha512sums=('efd040d46f2ed1eff5a2eb336e55fd465176c23c728935ee488a474b2f0c8dddd275805ee3be79f20afc523a183adb3d88a0e7bee095047912cf70741e2c0b32'
            '4c62f9183fb0ec8f6273108e5f4dd143615db5b1ab428463f0cb859d5f5f4f32cee3ba7c4f6d7278953e8a25466e68de7aab24eca7f607f998129a61ecce2ff5')
sha256sums=('e9610eca329e3346c0d5b76f675f90be36d5c019378ea98f10931daba1c98314'
            'dbbe92c8c1eef8bfab5792d03d325c4de5fa7bf46faf55eeb1134ba755847a12')
validpgpkeys=('E2A30324A4465A4D5882692EC08038BDF280D33E')
CFLAGS="-flto -O3 $CFLAGS"

build() {
	cd "bc-$pkgver"
	PREFIX=/usr ./configure.sh -GP
	make
}

check() {
	cd "bc-$pkgver"
	make check
}

package() {
	cd "bc-$pkgver"
	DESTDIR="$pkgdir/" make install
}
