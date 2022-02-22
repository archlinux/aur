# Maintainer: Daniel Otero <otero dot o dot daniel at gmail dot com>
pkgname=cvise
pkgver=2.4.0
pkgrel=1
pkgdesc="A super-parallel Python port of the C-Reduce"
arch=('x86_64')
url="https://github.com/marxin/cvise"
license=('custom:University of Illinois')
depends=('clang' 'llvm-libs' 'python' 'python-chardet' 'python-pebble' 'python-psutil' 'unifdef')
makedepends=('git' 'cmake' 'llvm')
checkdepends=('python-pytest' 'python-pytest-flake8')
optdepends=('colordiff')
source=("https://github.com/marxin/cvise/archive/v$pkgver.tar.gz")
sha256sums=('55ae8c39bdbaddba9a2ac1173bef7995e58387bc81f4610125dd1488c8e8b1ae')

build() {
	cmake -B build -S "${pkgname}-${pkgver}" \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

check() {
	cd build
	ctest --output-on-failure
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
