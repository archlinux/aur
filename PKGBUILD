# Maintainer: Shuyuan Liu (AUR)

pkgname=aptdec-git
pkgver=r178.5f91799
pkgrel=2
pkgdesc='NOAA APT satellite imagery decoder'
arch=('x86_64' 'arm' 'aarch64')
url="https://github.com/Xerbo/aptdec"
license=('GPL2')
depends=('libsndfile' 'libpng')
makedepends=('git' 'cmake')
provides=('aptdec')
conflicts=('aptdec')
md5sums=('SKIP'
         'cbbc61ab679d38896a1bd2de1631227c')

source=('git+https://github.com/Xerbo/aptdec'
	'install-palettes-to-usr-share.patch')

pkgver() {
	cd aptdec
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd aptdec
	patch --input="${srcdir}/install-palettes-to-usr-share.patch"
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

