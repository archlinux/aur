# Maintainer: Daniel Otero <otero dot o dot daniel at gmail dot com>
pkgname=cvise
pkgver=2.4.0
pkgrel=2
pkgdesc="A super-parallel Python port of the C-Reduce"
arch=('x86_64')
url="https://github.com/marxin/cvise"
license=('custom:University of Illinois')
depends=('clang' 'llvm-libs' 'python' 'python-chardet' 'python-pebble' 'python-psutil' 'unifdef')
makedepends=('git' 'cmake' 'llvm')
checkdepends=('python-pytest' 'python-pytest-flake8')
optdepends=('colordiff')
source=("https://github.com/marxin/cvise/archive/v$pkgver.tar.gz")
sha256sums=('3cf8c7e6b5ece928cedfff99c6453a0a595cdf57d8356bafe15ee103814e1863')

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
