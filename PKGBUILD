# Maintainer: Dan Griffiths <me at evertiro dot com>

pkgname=astra-foundry
pkgver=1.2.0
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
makedepends=('cmake' 'qt6-tools')
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/AstraSuite/Foundry/archive/refs/tags/v${pkgver}.zip"
)
conflicts=(
	'astra-foundry-bin'
	'astra-foundry-git'
)
sha256sums=(
	'b9451035aa1479ae861eb1ff1da31bdaf1b6b772f5420b19c1643d64f1a813d0'
)
build()
{
	cd "${srcdir}/Foundry-${pkgver}"

	cmake -B build -S . -DCMAKE_BUILD_TYPE=Release
	cmake --build build
}
package()
{
	cd "${srcdir}/Foundry-${pkgver}"

	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
