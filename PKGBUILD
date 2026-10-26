# Maintainer: callmetango
# Contributor: Antonio Rojas <arojas@archlinux.org>

: "${USE_SYSTEMD:=1}"

pkgname=sonic-system-stats
pkgver=6.8.0
pkgrel=1
pkgdesc='A plugin based system monitoring daemon'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-system-stats'
license=('LGPL-2.0-or-later')
depends=(
	'glibc'
	'libnl'
	'libstdc++'
	'libudev.so'
	'lm_sensors'
	'qt6-base'
	'sonic-frameworks-core-addons'
	'sonic-frameworks-crash-handler'
	'sonic-frameworks-device-integration'
	'sonic-frameworks-internationalization'
	'sonic-frameworks-io'
	'sonic-frameworks-networkmanager'
	'sonic-system-monitor-library'
)
makedepends=('sonic-frameworks-cmake-modules')
((USE_SYSTEMD)) || optdepends+=(
	'esettingsd: hostname1 service for system information on dinit, runit or s6'
	'openrc-settingsd: hostname1 service for system information on OpenRC'
)
provides=('ksystemstats')
conflicts=('ksystemstats')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e627e2242ad46659f4cb776c55f8ec59d6a1af3103dc8b210ac9eb1abe01833c')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
