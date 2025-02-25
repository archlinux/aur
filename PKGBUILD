# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Leo sk <sk.griffinix@gmail.com>

pkgname=sierra-breeze-enhanced
_pkgname=SierraBreezeEnhanced
pkgver=2.1.0
pkgrel=1
pkgdesc="A kwin decoration with support for transparency, rounded corners, multiple titlebar button presets and more"
arch=('x86_64')
url="https://github.com/kupiqu/${_pkgname,,}"
license=('GPL-3.0-or-later')
depends=('kwin>=6.3' 'qt6-base>=6.8')
makedepends=('cmake' 'extra-cmake-modules')
source=("${url}/archive/V.${pkgver}/${pkgname}-V.${pkgver}.tar.gz")
sha512sums=('5e396f3663e91bd94a82f2fdcd7bc5bd75b14b6ad6a8cfc9afaacd4d8795da1219f90f1ee4f343f506f87e17a4aa92a1408fbc6bbfa733506b9eafdea22375a3')

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
