# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-interface-libraries
pkgver=6.8.0.1
pkgrel=1
pkgdesc='SonicDE library and runtime components'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-interface-libraries'
license=('LGPL-2.0-or-later')
depends=(
	'glibc'
	'libgcc'
	'libglvnd'
	'libstdc++'
	'libx11'
	'libxcb'
	'qt6-base'
	'qt6-declarative'
	'sonic-activities'
	'sonic-frameworks-color-scheme'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-gui-addons'
	'sonic-frameworks-icon-themes'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-keybind'
	'sonic-frameworks-notifications'
	'sonic-frameworks-package'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-settings'
	'sonic-frameworks-svg'
	'sonic-frameworks-widgets-addons'
	'sonic-frameworks-windowsystem'
)
makedepends=(
	'sonic-frameworks-cmake-modules'
	'sonic-frameworks-doctools'
)
provides=('libplasma')
conflicts=(
	'libplasma'
	'plasma-framework'
)
replaces=('plasma-framework')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('fbe21ba114af62b024045dd62fa461e1d904c1ad97b3a47bb559f84fea0ba41c')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
