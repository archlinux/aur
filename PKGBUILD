# Maintainer: Dan Griffiths <me at evertiro dot com>

pkgname=astra-airlock
pkgver=1.1.2
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
source=(
	"${pkgname}-${pkgver}::https://github.com/AstraSuite/Airlock/archive/refs/tags/v${pkgver}.zip"
)
conflicts=(
	'astra-airlock-bin'
	'astra-airlock-git'
)
sha256sums=(
	'e790ce3efae269b4e4b4d68c733e70bb471dc928d0081c5d6ac38c200de508de'
)
build()
{
	cd "${srcdir}/Airlock-${pkgver}"

	cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release
	cmake --build build
}
package()
{
	cd "${srcdir}/Airlock-${pkgver}"

	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
