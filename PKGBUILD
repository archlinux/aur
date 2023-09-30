# Maintainer:  Alexander <tx00100xt@yandex.ru>
# Contributer: Alexander <tx00100xt@yandex.ru>

pkgname=seriousrunner
pkginstdir=seriousrunner
pkgver=1.1
_srcname="Serious-Runner-$pkgver"
pkgrel=1
pkgdesc="Serious Runner program that loads and runs content created by users."
arch=('x86_64')
url="https://github.com/tx00100xt/Serious-Runner"
license=('GPL2')

makedepends=('cmake' 'make' 'sed' 'qt5-base' 'libarchive' 'xz' 'bzip2')
source=("https://github.com/tx00100xt/Serious-Runner/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5a429ef0f4c649b7a883867e9ad297e6afdd6af6baa1639a5289476ce450e532')

build() {
	mkdir "$_srcname"/build && cd "$_srcname"/build
    cmake  -DCMAKE_BUILD_TYPE='Release' \
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
