# Maintainer: mr_s1m0n silverphoneix@disroot.org
pkgname=bsdcoreutils-git
_pkgname=BSDCoreUtils
pkgver=v6.7.r2
pkgrel=1
pkgdesc="Port of OpenBSD & NetBSD coreutils to Linux."
arch=('x86_64')
url="https://github.com/DiegoMagdaleno/BSDCoreUtils"
license=('ISC')
depends=('glibc' 'openssl')
makedepends=('git' 'cmake' 'make' 'byacc')
provides=('coreutils')
conflicts=('coreutils')
replaces=('coreutils')
source=("git+https://github.com/DiegoMagdaleno/BSDCoreUtils.git")
sha256sums=('SKIP')

prepare() {
	cd"$srcdir/$_pkgname"
	mkdir -p build
}

build() {
	cd"$srcdir/&_pkgname/build"
	cmake ..
	make
}

package() {
	cd"$srcdir/_pkgname/build"
	make DESTDIR="$pkgdir" install
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
