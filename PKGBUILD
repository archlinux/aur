# Maintainer: Dan Griffiths <me at evertiro dot com>

pkgname=astra-flightdeck
pkgver=1.0.0
pkgrel=1
pkgdesc='A powerful, modern Hyprland configuration manager'
arch=('x86_64')
url='https://github.com/AstraSuite/Flightdeck'
license=('GPL-3.0-only')
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'qt6-declarative'
	'qt6-shadertools'
	'qt6-svg'
)
optdepends=(
	'caelestia-cli: dynamic color scheme syncing'
)
makedepends=(
	'cmake'
	'ninja'
)
conflicts=(
	'astra-flightdeck-git'
)
source=(
	"https://github.com/AstraSuite/Flightdeck/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=(
	'f5f0f1fef13c5b0f42ce5584ebc804637cc1be4d7b18956a8ddb5460b25d1f9b'
)
build()
{
	cd "${srcdir}/${pkgname}-${pkgver}"

	cmake -B build -S . -G Ninja -DCMAKE_BUILD_TYPE=Release -DFLIGHTDECK_VERSION=${pkgver}
	cmake --build build
}
package()
{
	cd "${srcdir}/${pkgname}-${pkgver}"

	DESTDIR="${pkgdir}" cmake --install build
}
