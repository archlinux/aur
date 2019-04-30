# Maintainer: Alex Dewar <a.dewar@sussex.ac.uk>
pkgname=genn
pkgver=4.0.0_RC1
pkgrel=1
pkgdesc="GeNN: GPU-enhanced neural networks (version 4)"
arch=(x86_64)
url="https://github.com/genn-team/genn"
license=('GPL')
depends=(cuda)
makedepends=(doxygen)
options=(staticlibs)
source=("$url/archive/${pkgver//_/-}.tar.gz")
sha256sums=('b94c0b8c05d8525987f9d4279478dd41f68e8d9824cb5344adb5fbe257b38e99')

build() {
	cd genn-${pkgver//_/-}

	# Generate documentation with doxygen
	./makedoc

	# Build libgenn.a etc.
	sed -i 's|/usr/local|'$pkgdir'/usr|' Makefile
	make
}

package() {
	cd genn-${pkgver//_/-}

	# Install libs and headers
	PREFIX="$pkgdir"/usr/ make install

	# Install documentation
	mkdir -p "$pkgdir"/usr/share/genn/documentation
	cp -rf documentation/html/* "$pkgdir"/usr/share/genn/documentation
}
