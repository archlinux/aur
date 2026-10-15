# Maintainer: Dan Griffiths <me at evertiro dot com>

pkgname=astra-flightdeck-git
pkgver=1.0.0.r1.gd47a5b5
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
	'git'
	'ninja'
)
conflicts=(
	'astra-flightdeck'
)
source=(
	"${pkgname}::git+${url}.git"
)
sha256sums=(
	'SKIP'
)
pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
build()
{
	cd "${srcdir}/${pkgname}"

	cmake -B build -S . -G Ninja -DCMAKE_BUILD_TYPE=Release
	cmake --build build
}
package()
{
	cd "${srcdir}/${pkgname}"

	DESTDIR="${pkgdir}" cmake --install build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
