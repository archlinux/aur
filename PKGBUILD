# Maintainer: hanker
# Contributor: Maarten de Vries <maarten@de-vri.es>
pkgname=dynamixel-sdk
pkgver=4.1.0
pkgrel=1
pkgdesc="SDK for communicating with Dynamixel motors (C and C++ bindings)"
url="https://github.com/ROBOTIS-GIT/DynamixelSDK"
arch=(x86_64 i386)
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ROBOTIS-GIT/DynamixelSDK/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('fb44d8e1abb3b4f6c18716b3bd8998664d9244a4e3663c9bfb4eb32c29f773895710a44d9344b245e3767c939dc60c9548c2aecea16f2adece605881f47eafaf')

build() {

	cd "$srcdir/DynamixelSDK-$pkgver"

	# C library
	cmake \
		-S c \
		-B build-c \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib

	cmake --build build-c

	# C++ library
	cmake \
		-S c++ \
		-B build-cpp \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib

	cmake --build build-cpp
}

package() {

	cd "$srcdir/DynamixelSDK-$pkgver"

	# Install C library
	DESTDIR="$pkgdir" cmake --install build-c

	# Install C++ library
	DESTDIR="$pkgdir" cmake --install build-cpp

	# License
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
