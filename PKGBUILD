# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-welcome-center
pkgver=6.8.0
pkgrel=2
pkgdesc='A friendly onboarding wizard for SonicDE'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-welcome-center'
license=('LGPL-2.0-or-later')
depends=(
	'glibc'
	'knewstuff' # org.kde.knewstuff-dialog
	'libstdc++'
	'qt6-base'
	'qt6-declarative'
	'sonic-frameworks-app-info'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-crash-handler'
	'sonic-frameworks-dbus'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-keybind'
	'sonic-frameworks-progress-ui'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-quick-ui-addons'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-utils'
	'sonic-frameworks-svg'
	'sonic-frameworks-user-feedback'
	'sonic-frameworks-windowsystem'
	'sonic-interface-libraries'
	'sonic-network-manager'
	'sonic-plasma5-support-library'
)
makedepends=('sonic-frameworks-cmake-modules')
provides=('plasma-welcome')
conflicts=('plasma-welcome')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('675f9397febe1913cd541345fa5d0dfb328af176d1aa04dda347ce4272989ca0')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
