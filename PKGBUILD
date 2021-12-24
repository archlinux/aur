# Maintainer: silverhikari
pkgname=sinsy-isengaara-git
_pkgname=sinsy
pkgver=0.9.6rc0.r3.g036c33a
pkgrel=1
pkgdesc="fork of sinsy made to use with qtau"
arch=('x86_64')
url="https://notabug.org/isengaara/sinsy"
license=('GPL')
depends=('hts-engine-api-git' 'sekai-git' 'boost-libs')
makedepends=('git' 'cmake')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
source=('git+https://notabug.org/isengaara/sinsy')
md5sums=('SKIP')
pkgver() {
	cd "$srcdir/${_pkgname%-git}"
    git describe --long --tags | sed 's|^upstream/||;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -B build -S "sinsy" \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev -DBUILD_SHARED_LIBS=ON
    make -C build
}

package() {
	cd "build"
	make DESTDIR="$pkgdir/" install
}
