# Maintainer: Max Bruckner <max at maxbruckner dot de>
pkgname=cpp-dependencies
pkgver=1.1
pkgrel=3
pkgdesc="Tool to check C++ #include dependencies (dependency graphs created in .dot format)"
arch=('x86_64' 'i686')
url="https://github.com/tomtom-international/cpp-dependencies"
license=('Apache')
optdepends=('graphviz')
makedepends=('cmake')
conflicts=('cpp-dependencies-git')
source=("cpp-dependencies-$pkgver.tar.gz::https://github.com/tomtom-international/cpp-dependencies/archive/$pkgver.tar.gz")
sha512sums=('e8748ee46d756198bd2045694d1159570e41d11a49c915d694135965e7245ed357e02862b21b443b09c07337aea05dd27a4ef06e36a463f807d28668a2f911c3')

build() {
	cd "$pkgname-$pkgver" || exit 1
	mkdir -p build || exit 1
	cd build || exit 1
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr
	make
}

check() {
	cd "$pkgname-$pkgver/build" || exit 1
	make test
}

package() {
	cd "$pkgname-$pkgver/build" || exit 1
	make DESTDIR="$pkgdir/" install
}
