# Maintainer: Mark Austin <ganthore@gmail.com>

pkgname=keysmith-git
pkgver=v0.1.r199.g52bdf6e
pkgrel=1
pkgdesc="An application to generate two-factor authentication (2FA) tokens."
url="https://github.com/KDE/keysmith"
arch=('i686' 'x86_64')
license=('GPL')

depends=('frameworkintegration' 'libsodium' 'qt5-base')
makedepends=('cmake' 'extra-cmake-modules' 'git')
provides=('keysmith' 'keysmith-git')
checkdepends=()
optdepends=()
provides=()
conflicts=("keysmith")

options=('!libtool' '!emptydirs')

source=("git+https://github.com/KDE/keysmith.git")

sha256sums=('SKIP')

pkgver() {
  cd keysmith
  git describe --long | sed 's/-/.r/;s/-/./'
}

prepare() {
	cd keysmith
}

build() {
	cd keysmith
	mkdir -pv build
	cmake -S . -B build -G "Unix Makefiles"
	cd build
	make all
}

package() {
        cd keysmith/build
	make DESTDIR="$pkgdir" install
}
