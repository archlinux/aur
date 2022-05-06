# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

## GPG key: https://github.com/scarlettgatelymoore.gpg

pkgname=libkvkontakte
pkgver=5.0.0
pkgrel=4
pkgdesc="C++ library for asynchronous interaction with VK social network via its web API"
arch=('x86_64')
url='https://github.com/kde/libkvkontakte'
license=('GPL' 'LGPL')
depends=('kdewebkit')
makedepends=('cmake' 'extra-cmake-modules')
provides=('libKF5Vkontakte.so=2-64')
source=("https://download.kde.org/stable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('00f11a13e1c3c10c7abd53b300237a9b7ab5c9b3b80e0381e01993e82c768193'
            'SKIP')
validpgpkeys=('7C35920F1CE2899E8EA9AAD02E7C0367B9BFA089') # Scarlett Clark <sgclark@kde.org>

build() {
	cmake \
		-B build \
		-S "$pkgname-$pkgver" \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_TESTING=OFF \
		-Wno-dev
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir" install
}
