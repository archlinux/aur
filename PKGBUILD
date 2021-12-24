# Maintainer: silverhikari
pkgname=sekai-git
_pkgname=sekai
pkgver=0.5.5.r10.g44c7f8e
pkgrel=1
pkgdesc="extended version of the world speech kit for qtau"
arch=('x86_64')
url="https://notabug.org/isengaara/sekai"
license=('GPL')
depends=('libsndfile' 'gsl' 'espeak-ng' 'fftw')
makedepends=('git' 'boost-libs' 'boost')
provides=("sekai")
source=('git+https://notabug.org/isengaara/sekai')
md5sums=('SKIP')
pkgver() {
	cd "$srcdir/${_pkgname}"
    git describe --long --tags | sed 's|^upstream/||;s/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
	cmake -B build -S "sekai" \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
	make -C build
}
package() {
	cd "$srcdir/build"
	make DESTDIR="$pkgdir/" install
}
