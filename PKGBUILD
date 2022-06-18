#Maintainer: Evan Purkhiser <evanpurkhiser@gmail.com>
#Contributor: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=libkeyfinder-git
pkgdesc="Musical key detection for digital audio."
url="https://github.com/mixxxdj/libkeyfinder"
license=('GPL3')
pkgver=333.4e1a502
pkgrel=1

provides=(libkeyfinder)
conflicts=(libkeyfinder)

source=("$pkgname::git+$url.git")
sha256sums=('SKIP')
depends=('fftw')
makedepends=('git' 'cmake')
arch=('i686' 'x86_64')

pkgver() {
	cd "$srcdir/$pkgname"
	echo $(git rev-list --count main).$(git rev-parse --short main)
}

build() {
	cd "$srcdir/$pkgname"

	# Disable building unit tests so we do not need the catch2 dep
	cmake -DBUILD_TESTING=OFF -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr -S . -B build
	cmake --build build
}

package() {
	cd "$srcdir/$pkgname"

	cmake --install build
}
