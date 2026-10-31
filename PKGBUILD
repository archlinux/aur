# Maintainer: Sanjaya Danushka <dsanjaya712 [at] gmail [dot] com>
# Contributor: Anton Orlichenko <aorliche [at] gmail [dot] com>

pkgname=antfood-git
pkgver=r28.aed379e
pkgrel=1
pkgdesc='A text-first app for recording and viewing calories, weight, and other daily events'
arch=('x86_64' 'aarch64')
url='https://github.com/aorliche/antfood'
license=('MIT')
provides=('antfood')
conflicts=('antfood')

# Core runtime requirements
depends=('kirigami' 'qt6-declarative' 'qt6-svg' 'qqc2-desktop-style' 'ki18n' 'kcoreaddons' 'kiconthemes')

# Requirements to compile the source
makedepends=('extra-cmake-modules' 'cmake' 'git')

source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake -B build -S "${pkgname}" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
