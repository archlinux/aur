# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=libinstpatch
pkgver=1.1.0
pkgrel=1
pkgdesc="Instrument patch library"
arch=('x86_64' 'i386')
url="http://swamiproject.org"
license=('LGPLv2')
groups=()
depends=('glib2' 'libsndfile')
makedepends=('cmake' 'python3')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/swami/libinstpatch/archive/v$pkgver.tar.gz" libinstpatch-cmake-fixes.patch)
noextract=()
md5sums=('707ac830039f9cfa1686f213c7a03724' '4cccbb5ff98cb9151548cde16166044e')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 --input=${srcdir}/libinstpatch-cmake-fixes.patch
}

build() {
	cd "$pkgname-$pkgver"
	mkdir build
	cd build
	cmake -DINTROSPECTION_ENABLED=off -DCMAKE_INSTALL_PREFIX=/usr -DINCLUDE_INSTALL_DIR=/usr/include -DLIB_INSTALL_DIR=/usr/lib ..
	make
}

check() {
	cd "$pkgname-$pkgver"
	cd build
#	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	cd build
	make DESTDIR="$pkgdir/" install
}
