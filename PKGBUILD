# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Pierre Choffet <peuc@wanadoo.fr>
# shellcheck shell=bash disable=SC2034,SC2164
_pkgname=ring-kde
pkgname=$_pkgname-git
pkgver=3.1.0.r78.gd348e06a
pkgrel=1
pkgdesc="The KDE client for the Ring communication framework"
arch=('x86_64')
url="https://jami.net/"
license=('GPL')
groups=('ring')
depends=('libringqt' 'knotifyconfig' 'kdeclarative' 'kirigami2')
makedepends=('git' 'extra-cmake-modules' 'kdoctools' 'qt5-tools')
provides=("$_pkgname")
conflicts=("$_pkgname")
changelog="ChangeLog"
source=('git://anongit.kde.org/ring-kde.git')
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
		-DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd build
	# shellcheck disable=SC2154
	make DESTDIR="$pkgdir" install
}
