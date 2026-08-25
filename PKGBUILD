# Maintainer: Dan Griffiths <me at evertiro dot com>

pkgname=astra-foundry-git
pkgver=1.3.1.r0.g86e2e2a
pkgrel=1
pkgdesc='Unified package manager for Flatpak, Pacman, AUR, and AppImage.'
arch=('x86_64')
url='https://github.com/AstraSuite/Foundry'
license=('GPL-3.0-only')
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'qt6-declarative'
	'qt6-m3shapes-git'
	'qt6-shadertools'
	'qt6-svg'
)
optdepends=(
	'desktop-file-utils: support for AppImage packages'
	'flatpak: support for flatpak packages'
	'paru: support for AUR packages'
	'yay: support for AUR packages'
)
makedepends=(
	'cmake'
	'git'
	'qt6-tools'
)
source=(
	"${pkgname}::git+${url}.git"
)
provides=('astra-foundry')
conflicts=(
	'astra-foundry'
	'astra-foundry-bin'
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

	cmake -B build -S . -DCMAKE_BUILD_TYPE=Release
	cmake --build build
}
package()
{
	cd "${srcdir}/${pkgname}"

	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
