# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Leo sk <sk.griffinix@gmail.com>

pkgname=sierra-breeze-enhanced
_pkgname=SierraBreezeEnhanced
pkgver=2.1.1
pkgrel=1
pkgdesc="A kwin decoration with support for transparency, rounded corners, multiple titlebar button presets and more"
arch=('x86_64')
url="https://github.com/kupiqu/${_pkgname,,}"
license=('GPL-3.0-or-later')
depends=('kwin>=6.3' 'qt6-base>=6.9')
makedepends=('cmake' 'extra-cmake-modules')
source=("${url}/archive/V.${pkgver}/${pkgname}-V.${pkgver}.tar.gz")
sha512sums=('5ebe3dcb0e9ab56eee914aefa249a2664e62d1c68e1d623bf0e2ef7e1c1c735e3a63f841db8a5c910b21935ee13ba35eef4443ef2f1bc23fc9eda2e36d81ad7b')

build() {
	cmake -B build -S "${_pkgname}-V.${pkgver}" \
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
