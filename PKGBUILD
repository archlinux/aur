# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: 

pkgname=qactus-git
pkgver=v0.6.0.r1.gd99d5cd
pkgrel=1
pkgdesc="A Qt-based OBS notifier application."
arch=('i686' 'x86_64')
url="https://github.com/javierllorente/qactus"
license=('GPL2' 'GPL3')
depends=('qtkeychain-qt5')
makedepends=('git' 'harfbuzz')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
install="${pkgname%-*}.install"
source=('git://github.com/javierllorente/qactus.git')
md5sums=('SKIP')

pkgver() {
	cd "${pkgname%-*}"

	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "${pkgname%-*}"

	if [[ -d build ]]; then
	rm -rf build
	fi
	mkdir build && cd build

	qmake-qt5 PREFIX=/usr ../qactus.pro
	make
}

package() {
	cd "${pkgname%-*}"/build

	make INSTALL_ROOT="${pkgdir}" install
}
