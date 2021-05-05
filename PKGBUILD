# Maintainer: Shuyuan Liu (AUR)

pkgname=impact-git
pkgver=r1.f6f73e8
pkgrel=1
pkgdesc='Meteor-M LRPT decoder, successor of meteor_decode'
arch=('x86_64' 'arm' 'aarch64')
url="https://github.com/dbdexter-dev/impact"
license=('MIT')
optdepends=('libpng')
makedepends=('git' 'cmake' 'libpng')
provides=('impact')
conflicts=('impact')
md5sums=('SKIP')

source=('git+https://github.com/dbdexter-dev/impact')

pkgver() {
	cd impact
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd impact
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX='/usr' ..
	make
}

package() {
	cd impact/build
	make DESTDIR="$pkgdir/" install
}

