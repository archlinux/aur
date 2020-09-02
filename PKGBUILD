# Maintainer: Lara <aur@lara.uber.space>
pkgname=trebleshot
_sourcename=desktop
pkgver=0.1.0_alpha2
pkgrel=2
pkgdesc="A multi-platform file-sharing tool"
arch=(x86_64)
url="https://github.com/trebleshot/$_sourcename"
license=('GPL2')
depends=('qt5-base' 'kdnssd')
makedepends=('cmake')
optdepends=('qt5-wayland: Wayland support')
source=("https://github.com/trebleshot/$_sourcename/archive/${pkgver/_/-}.tar.gz")
sha1sums=('43cae6cd1afa764ffc8e0bdef677973a09395d20')

prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -G "Unix Makefiles" ../$_sourcename-${pkgver/_/-}
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir/" install
}
