#!/bin/bash
# shellcheck disable=SC2034,SC2164
# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Daniel Cohen <dan@supercore.co.uk>
pkgname=plymouth-kcm
pkgver=5.14.2
pkgrel=1
pkgdesc="KCM to manage the Plymouth (Boot) theme"
arch=('x86_64')
url="https://cgit.kde.org/plymouth-kcm.git/"
license=('GPL')
depends=('plymouth' 'knewstuff' 'kdeclarative')
makedepends=('extra-cmake-modules' 'qt5-tools')
source=("https://download.kde.org/stable/plasma/$pkgver/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('ec72c0934d588a856b46fc0bef0cf347ed236b87091913290c32054d061ac67f'
            'SKIP')
validpgpkeys=('2D1D5B0588357787DE9EE225EC94D18F7F05997E'  # Jonathan Riddell
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D') # Bhushan Shah

prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake ../"$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX="$(qtpaths --install-prefix)" \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_TESTING=OFF
	make
}

package() {
	cd build
	# shellcheck disable=SC2154
	make DESTDIR="$pkgdir" install
}
