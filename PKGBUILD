# Maintainer: mr_s1m0n silverphoneix@disroot.org
pkgname=bsdcoreutils-git
_pkgname=BSDCoreUtils
pkgver=v6.7.r2
pkgrel=1
pkgdesc="Port of OpenBSD & NetBSD coreutils to Linux by DiegoMagdaleno."
arch=('x86_64')
url="https://github.com/DiegoMagdaleno/BSDCoreUtils"
license=('ISC')
depends=('glibc' 'openssl' 'libbsd' 'man-db')
makedepends=('git' 'cmake' 'make' 'byacc')
#provides=('coreutils')
#conflicts=('coreutils')
#replaces=('coreutils')
source=("git+https://github.com/DiegoMagdaleno/BSDCoreUtils.git")
sha256sums=('SKIP')

prepare() {
	cd "$srcdir/$_pkgname"
	mkdir -p build
}

build() {
	cd "$srcdir/$_pkgname/build"
	cmake .. \
    	-DCMAKE_INSTALL_PREFIX=/opt/BSDuserland \
    	-DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd "$srcdir/$_pkgname/build"
	make DESTDIR="$pkgdir" install
	find src -name "*.1" -exec install -Dm644 "{}" "$pkgdir/usr/share/man/man1/{}"
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
