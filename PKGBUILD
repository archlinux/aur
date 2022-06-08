# Maintainer: Shuyuan Liu (AUR)

pkgname=aptdec-git
pkgver=r190.b1cc748
pkgrel=1
pkgdesc='NOAA APT satellite imagery decoder'
arch=('x86_64' 'arm' 'aarch64')
url="https://github.com/Xerbo/aptdec"
license=('GPL2')
depends=('libsndfile' 'libpng')
makedepends=('git' 'cmake')
provides=('aptdec')
conflicts=('aptdec')
source=(
	"git+$url"
)
md5sums=('SKIP')

pkgver() {
	cd aptdec
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd aptdec
}

build() {
	cmake -B build -S aptdec \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX='/usr'
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir/" install
}

