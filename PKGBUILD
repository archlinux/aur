# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Leo sk <sk.griffinix@gmail.com>

pkgname=sierra-breeze-enhanced
_pkgname=SierraBreezeEnhanced
pkgver=2.0.1
pkgrel=1
pkgdesc="A kwin decoration with support for transparency, rounded corners, multiple titlebar button presets and more"
arch=('x86_64')
url="https://github.com/kupiqu/${_pkgname,,}"
license=('GPL-3.0-or-later')
depends=('kwin')
makedepends=('cmake' 'extra-cmake-modules')
source=("${url}/archive/V${pkgver}/${pkgname}-V${pkgver}.tar.gz")
sha512sums=('1c7f55e979c854135a4c6e21d9838df8de0b7dd0ee252f100c8b622e72224d19bf8e06318ad43367112f6c3422ac5ac44242b74635cce5e96107c1ea447ce838')

build() {
	cmake -B build -S "${_pkgname}-${pkgver}" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DKDE_INSTALL_LIBDIR=lib \
		-DBUILD_TESTING=OFF \
		-DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
		-Wno-dev
}

package() {
	#DESTDIR="$pkgdir" cmake --install build
	make -C build DESTDIR="$pkgdir" install
}
