# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-terminal-tools
pkgver=6.8.0
pkgrel=1
pkgdesc='Tools based on SonicDE Frameworks to better interact with the system'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-terminal-tools'
license=('LGPL-2.0-or-later')
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'qt6-svg'
	'sh'
	'sonic-frameworks-app-info'
	'sonic-frameworks-autocomplete'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-icon-themes'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-root-shell'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-utils'
	'sonic-frameworks-ui-components'
	'sonic-frameworks-widgets-addons'
	'sonic-frameworks-windowsystem'
)
makedepends=(
	'sonic-frameworks-cmake-modules'
	'sonic-frameworks-doctools'
)
optdepends=('sonic-system-info: view hardware information')
provides=('kde-cli-tools')
conflicts=('kde-cli-tools')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d91294df276e1bbcfdd540f8e5b203e03e59e1c4119ad5ae4dd9d96fc0e920a4')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
