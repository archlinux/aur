# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Elie Donadio <elidoset@gmail.com>
pkgname=yoga-git
pkgver=2.0.1
pkgrel=1
pkgdesc="The yoga flexbox layout engine's C++ library"
arch=(x86_64)
url="https://github.com/facebook/yoga"
license=('MIT')
#groups=()
#depends=()
makedepends=(cmake git)
#checkdepends=()
#optdepends=()
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
#changelog=
source=($pkgname-$pkgver.tar.gz::"https://github.com/facebook/yoga/archive/refs/tags/v${pkgver}.tar.gz")

#noextract=()
md5sums=(SKIP)
#validpgpkeys=()

#prepare() {
#	cd "$pkgname-$pkgver"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}

build() {
	cd "${srcdir}/yoga-${pkgver}"
    cmake -B build -S . -DCMAKE_BUILD_TYPE="Release" -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_INSTALL_COMPONENT=yogacore -DCMAKE_SKIP_INSTALL_ALL_DEPENDENCY=TRUE
    cmake --build build --target yogacore
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
	cd "${srcdir}/yoga-${pkgver}/build"
	DESTDIR="$pkgdir" cmake --build . --target install/local
	
}
