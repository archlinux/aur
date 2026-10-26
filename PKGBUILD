# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=sonic-frameworks-package
pkgver=6.31.0
pkgrel=1
pkgdesc='Framework that lets applications manage user installable packages of non-binary assets'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-package'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'sonic-frameworks-archive'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-internationalization'
)
makedepends=(
	'doxygen'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
	'sonic-frameworks-doctools'
)
provides=('kpackage')
conflicts=('kpackage')
groups=('sonicde-frameworks')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('68d743017437d901f50f873cfe770f512e96584cf5664647e1f79c8823358616')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
