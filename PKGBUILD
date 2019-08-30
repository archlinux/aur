# Maintainer: Alexandre Bouvier <contact@amb.tf>
# shellcheck shell=bash disable=SC2034,SC2164
_pkgname=libringqt
pkgname=$_pkgname-git
pkgver=ring.kde.3.1.0.r128.g6a275daf
pkgrel=1
pkgdesc="A library for GNU Ring, a secure communication platform"
arch=('x86_64')
url="https://github.com/Elv13/$_pkgname"
license=('LGPL')
groups=('ring')
depends=('ring-daemon' 'qt5-base')
makedepends=('git' 'cmake' 'qt5-tools' 'qt5-quickcontrols2')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake ../$_pkgname \
		-DCMAKE_INSTALL_PREFIX="$(qtpaths --install-prefix)" \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd build
	# shellcheck disable=SC2154
	make DESTDIR="$pkgdir" install
}
