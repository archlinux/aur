# Maintainer: Dan Griffiths <me at evertiro dot com>

pkgname=astra-airlock-git
pkgver=1.1.2.r12.g9ef48d1
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
	'git'
	'ninja'
)
conflicts=(
	'astra-airlock'
	'astra-airlock-bin'
)
source=(
	"${pkgname}::git+${url}.git"
	"astra-airlock.install"
)
sha256sums=(
	'SKIP'
	'7d6ed7e60cc63afc2ff25321a19e55d817713ed38963547ae6b2c6d5672e39fc'
)
pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
build()
{
	cd "${srcdir}/${pkgname}"

	cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release
	cmake --build build
}
package()
{
	cd "${srcdir}/${pkgname}"

	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
