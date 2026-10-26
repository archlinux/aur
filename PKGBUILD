# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-frameworks-user-feedback
pkgver=6.31.0
pkgrel=1
pkgdesc='Framework for collecting user feedback for applications via telemetry and surveys'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-user-feedback'
license=(
	'LGPL-2.0-only'
	'LGPL-3.0-only'
)
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
)
makedepends=(
	'clang'
	'qt6-charts'
	'qt6-declarative'
	'qt6-svg'
	'qt6-tools'
	'sonic-frameworks-cmake-modules'
)
optdepends=(
	'qt6-charts: Feedback console'
	'qt6-declarative: QML bindings'
	'qt6-svg: Feedback console'
)
provides=('kuserfeedback')
conflicts=(
	'kuserfeedback'
	'kuserfeedback5'
)
replaces=('kuserfeedback5')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('bf40e82c34536d05de42725038b17453b52a203b3c90765d5ee6c79df3618498')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
