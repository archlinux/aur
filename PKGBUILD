# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: 

pkgname=styleproject-git
pkgver=r265.528ef21
pkgrel=1
pkgdesc="A maclike style for kde4."
arch=('i686' 'x86_64')
url='http://sourceforge.net/p/styleproject'
license=('GPL2')
depends=('qt5-x11extras' 'kdebase-workspace')
makedepends=('git' 'cmake' 'automoc4')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
source=('styleproject::git://git.code.sf.net/p/styleproject/code.git')
md5sums=('SKIP')

pkgver() {
	cd "${pkgname%-*}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname%-*}"

	if [[ -d build ]]; then
		rm -rf build
	fi
	mkdir build && cd build

	cmake .. \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd "${pkgname%-*}"/build

	make DESTDIR="$pkgdir" install
}
