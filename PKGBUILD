#!/bin/bash
# shellcheck disable=SC2034,SC2164
# Maintainer: Zack Emmert <zemmert@fastmail.com>
# Contributor Alexandre Bouvier <contact@amb.tf>
# Contributor: Daniel Cohen <dan@supercore.co.uk>
# Contributor: Jamesjon <universales@protonmail.com>
pkgname=plymouth-kcm
pkgver=5.16.5
pkgrel=2
pkgdesc="KCM to manage the Plymouth (Boot) theme"
arch=('x86_64')
url="https://cgit.kde.org/plymouth-kcm.git/"
license=('GPL')
depends=('plymouth' 'knewstuff' 'kdeclarative')
makedepends=('extra-cmake-modules' 'qt5-tools' 'kcmutils')
source=("https://download.kde.org/stable/plasma/$pkgver/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('db839c5fe9f6df882b95f436983c129cd553dd50e6cf1065c4410a91b20f1dcc'
            'SKIP')
validpgpkeys=('2D1D5B0588357787DE9EE225EC94D18F7F05997E'  # Jonathan Riddell
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah
              'D07BD8662C56CB291B316EB2F5675605C74E02CF') # David Edmundson

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
