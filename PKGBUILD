# Maintainer: Dan Griffiths <me at evertiro dot com>

pkgname=astra-airlock
pkgver=1.3.0
pkgrel=1
pkgdesc='A beautiful m3expressive greetd frontend based on Caelestia'
arch=('x86_64')
url='https://github.com/AstraSuite/Airlock'
license=('GPL-3.0-only')
depends=(
	'glibc'
	'greetd'
	'libstdc++'
	'qt6-base'
	'qt6-declarative'
	'qt6-m3shapes-git'
)
optdepends=(
	'caelestia-cli: dynamic color scheme synching with Caelestia'
	'cage: required if not using Hyprland'
	'hyprland: required if not using Cage'
	'wlr-randr: required if using monitor flags'
)
makedepends=(
	'cmake'
	'ninja'
)
conflicts=(
	'astra-airlock-bin'
	'astra-airlock-git'
)
source=(
	"https://github.com/AstraSuite/Airlock/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
	"astra-airlock.install"
)
sha256sums=(
	'947f8a6966a989c90dac753ad0e0c64097cf5c761d64ce975ff5427876f07cec'
	'7d6ed7e60cc63afc2ff25321a19e55d817713ed38963547ae6b2c6d5672e39fc'
)
build()
{
	cd "${srcdir}/${pkgname}-${pkgver}"

	cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release -DASTRA_AIRLOCK_VERSION=${pkgver}
	cmake --build build
}
package()
{
	cd "${srcdir}/${pkgname}-${pkgver}"

	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
