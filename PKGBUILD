# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-audio-applet-pulse
pkgver=6.8.0
pkgrel=2
pkgdesc='SonicDE applet for audio volume management using PulseAudio'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-audio-applet-pulse'
license=('LGPL-2.0-or-later')
depends=(
	'glib2'
	'glibc'
	'libcanberra'
	'libpulse'
	'libstdc++'
	'pulse-native-provider'
	'qt6-base'
	'qt6-declarative'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-data-models'
	'sonic-frameworks-dbus'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-keybind'
	'sonic-frameworks-qml-bridge'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-quick-ui-addons'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-utils'
	'sonic-frameworks-status-notification'
	'sonic-frameworks-svg'
	'sonic-interface-libraries'
	'sonic-pulseaudio-library'
	'sonic-workspace'
)
makedepends=(
	'sonic-frameworks-cmake-modules'
	'sonic-frameworks-doctools'
)
provides=('plasma-pa')
conflicts=('plasma-pa')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a4f8cdefc0dce1aa6df48178eafa159c81f7544996261ad4c6816092dd81c04a')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
