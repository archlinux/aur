# Maintainer:  Alexander <tx00100xt@yandex.ru>
# Contributer: Alexander <tx00100xt@yandex.ru>

pkgname=seriousrunner
pkginstdir=seriousrunner
pkgver=1.1.2
_srcname="Serious-Runner-$pkgver"
pkgrel=1
pkgdesc="Serious Runner program that loads and runs content created by users."
arch=('x86_64')
url="https://github.com/tx00100xt/Serious-Runner"
license=('GPL2')

makedepends=('cmake' 'make' 'sed' 'qt5-base' 'libarchive' 'xz' 'bzip2')
source=("https://github.com/tx00100xt/Serious-Runner/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("725decc771bed6199333959dec2fccc4766844d8c692ae7dbbf538183146cbfd")

build() {
	mkdir "$_srcname"/build && cd "$_srcname"/build
	cmake   -DCMAKE_BUILD_TYPE='Release' \
			-DCMAKE_INSTALL_PREFIX='/usr' \
			-Wno-dev ..
	cd .. && cd ..
	cmake --build "$_srcname"/build
}

check() {
	ctest --test-dir "$_srcname"/build --output-on-failure
}

package() {
	DESTDIR="$pkgdir" cmake --install "$_srcname"/build
}
