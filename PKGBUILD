# Maintainer: TBK <aur at jjtc dot eu>
# Contributor: TBK <aur at jjtc dot eu>

pkgname=libqtolm
pkgver=3.0.0
pkgrel=2
pkgdesc='A Qt wrapper for libolm'
url='https://gitlab.com/b0/libQtOlm'
arch=('any')
license=('GPL-3.0-or-later')
depends=('qt5-base' 'libolm')
conflicts=('libqtolm-git')
replaces=('libqtolm-git')
makedepends=('cmake')
source=("https://gitlab.com/b0/libQtOlm/-/archive/v$pkgver/libqtolm-v$pkgver.tar.gz")
_builddir="$pkgname-v$pkgver"

prepare() {
	cd "$_builddir"
	sed -i 's/utils.h/utilities.h/g' CMakeLists.txt libQtOlm.pri main.cpp

	cd lib
	mv utils.h utilities.h
	sed -i 's/utils.h/utilities.h/g' account.cpp groupsession.cpp pk.cpp session.cpp
}

build() {
    cd "$_builddir"
	cmake -B build \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DBUILD_SHARED_LIBS=true .
	make -C build
}

package() {
    cd "$_builddir"
	make -C build DESTDIR="$pkgdir" install
}

b2sums=('27e3bf4ea3c735358d954ac7d48e8762be91867617231ee8b2fee3774e22bb4d9381d030b9444d9a3e85c19c524a3918f9f6b1939dd0b95607d2e9aca85214d5')
b2sums=('27e3bf4ea3c735358d954ac7d48e8762be91867617231ee8b2fee3774e22bb4d9381d030b9444d9a3e85c19c524a3918f9f6b1939dd0b95607d2e9aca85214d5')
