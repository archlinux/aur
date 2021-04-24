# Maintainer: Shuyuan Liu (AUR)

pkgname='aptdec-git'
pkgver=r178.5f91799
pkgrel=1
pkgdesc='NOAA APT satellite imagery decoder'
arch=('x86_64' 'arm' 'aarch64')
url="https://github.com/Xerbo/aptdec"
license=('GPL2')
depends=('libsndfile' 'libpng')
makedepends=('git' 'cmake')
provides=('aptdec')
conflicts=('aptdec')
md5sums=('SKIP')

source=('git+https://github.com/Xerbo/aptdec')

pkgver() {
	cd "aptdec"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd aptdec
	mkdir -p build
	cd build
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX='/usr' ..
	make
}

package() {
	cd aptdec/build
	make DESTDIR="$pkgdir/" install
}

