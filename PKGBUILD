# Maintainer: callmetango
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Devin Lin <devin@kde.org>

: "${USE_SYSTEMD:=1}"

pkgname=sonic-mobile-interface
pkgver=6.8.0
pkgrel=2
pkgdesc='SonicDE interface for mobile devices'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-mobile-interface'
license=('GPL-3.0-or-later')
depends=(
	'bash'
	'glibc'
	'libgcc'
	'libstdc++'
	'libudev.so'
	'plasma-keyboard'
	'plasma-nano'
	'qcoro'
	'qt6-base'
	'qt6-declarative'
	'qt6-sensors'
	'sonic-audio-applet-pulse'
	'sonic-file-search-ui'
	'sonic-frameworks-addons-downloader'
	'sonic-frameworks-app-info'
	'sonic-frameworks-auth'
	'sonic-frameworks-bluetooth'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-data-models'
	'sonic-frameworks-dbus'
	'sonic-frameworks-device-integration'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-modemmanager'
	'sonic-frameworks-networkmanager'
	'sonic-frameworks-notifications'
	'sonic-frameworks-package'
	'sonic-frameworks-progress-ui'
	'sonic-frameworks-qml-bridge'
	'sonic-frameworks-quick-ui'
	'sonic-frameworks-quick-ui-addons'
	'sonic-frameworks-settings'
	'sonic-frameworks-settings-utils'
	'sonic-frameworks-svg'
	'sonic-frameworks-windowsystem'
	'sonic-interface-libraries'
	'sonic-network-manager'
	'sonic-pipewire'
	'sonic-power-management'
	'sonic-screen-library'
	'sonic-win'
	'sonic-workspace'
)
makedepends=(
	'sonic-frameworks-cmake-modules'
	'vulkan-headers'
)
optdepends=(
	'plasma-settings: System settings'
	'sonic-bluetooth-runtime: Bluetooth management'
	'sonic-screen: Screen management'
)
((USE_SYSTEMD)) || optdepends+=(
	'esettingsd: timedate1 service for dinit, runit or s6'
	'openrc-settingsd: timedate1 service for OpenRC'
)
provides=('plasma-mobile')
conflicts=('plasma-mobile')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5c79777f6f90451043aab480f1cbca72cac3fcdb4d19da31ab84435c10497b32')

build() {
	cmake -B build -S "$pkgname-$pkgver"
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}

