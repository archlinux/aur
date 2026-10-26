# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-frameworks-crash-handler
pkgver=6.31.0
pkgrel=1
pkgdesc='Support for application crash analysis and bug report from apps'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-crash-handler'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'libgcc'
	'libstdc++'
	'libx11'
	'qt6-base'
	'sonic-frameworks-core-addons'
)
makedepends=(
	'doxygen'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
)
optdepends=('sonic-dr-robotnik: SonicDE crash handler application')
provides=('kcrash')
conflicts=('kcrash')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('861cfef740bb6ba82bde263c4eefcc057652f37ed2bdac366b8f2c505396160c')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
