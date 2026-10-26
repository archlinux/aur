# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-screenies
pkgver=6.8.0.1
pkgrel=1
pkgdesc='SonicDE screenshot capture utility'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-screenies'
license=('GPL-2.0-or-later')
depends=(
	'ffmpeg'
	'glibc'
	'libgcc'
	'libpulse'
	'libstdc++'
	'libxcb'
	'qt6-base'
	'qt6-declarative'
	'qt6-imageformats'
	'qt6-multimedia'
	'qt6-multimedia-ffmpeg'
	'sonic-frameworks-app-info'
	'sonic-frameworks-barcode'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-crash-handler'
	'sonic-frameworks-dbus'
	'sonic-frameworks-gui-addons'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-keybind'
	'sonic-frameworks-notifications'
	'sonic-frameworks-progress-ui'
	'sonic-frameworks-purpose'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-ui'
	'sonic-frameworks-status-notification'
	'sonic-frameworks-widgets-addons'
	'sonic-frameworks-windowsystem'
	'sonic-frameworks-xml-gui'
	'sonic-quick-image-editor'
	'tesseract'
	'xcb-util'
	'xcb-util-cursor'
	'xcb-util-image'
)
makedepends=(
	'opencv' # unused upstream, but still in CMakeLists
	'sonic-frameworks-cmake-modules'
	'sonic-frameworks-doctools'
)
provides=('spectacle')
conflicts=('spectacle')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5be14a1dea67a4f197795dcdcd9ab85622090f4914ae66df5290f1badd201b65')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
