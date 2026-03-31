# Maintainer: mr_s1m0n silverphoneix@disroot.org
pkgname=bsdcoreutils-git
_pkgname=BSDCoreUtils
pkgver=v6.7.r2
pkgrel=1
pkgdesc="Port of OpenBSD & NetBSD coreutils to Linux from DiegoMagdaleno. [PLEASE NOTE THIS PACKAGE IN WIP]"
arch=('x86_64')
url="https://github.com/DiegoMagdaleno/BSDCoreUtils"
license=('ISC')
depends=('glibc' 'openssl')
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
	cmake ..
	make
}

package() {
	cd "$srcdir/BSDCoreUtils/build"
	make install -DCMAKE_INSTALL_PREFIX=/opt/BSDuserland
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	export PATH="/opt/BSDuserland:$PATH"
}
