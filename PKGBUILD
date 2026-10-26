# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-cmake-modules
pkgver=6.31.0
pkgrel=1
pkgdesc='Extra modules and scripts for CMake'
arch=('any')
url='https://github.com/Sonic-DE/sonic-frameworks-cmake-modules'
license=('LGPL')
depends=('cmake')
makedepends=(
	'python-requests'
	'python-sphinx'
	'qt6-tools'
)
optdepends=(
	'python-pyxdg: to generate fastlane metadata for Android apps'
	'python-requests: to generate fastlane metadata for Android apps'
	'python-yaml: to generate fastlane metadata for Android apps'
)
provides=('extra-cmake-modules')
conflicts=('extra-cmake-modules')
options=('!debug')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5b38480d00cfce6a86537a6a7581103e9973161627c49cd97a06c9824cb5e69e')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_HTML_DOCS=ON \
		-DBUILD_QTHELP_DOCS=ON \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
