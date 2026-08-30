# Maintainer: Dan Griffiths <me at evertiro dot com>

pkgname=astra-foundry
pkgver=1.5.0
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
	"https://github.com/AstraSuite/Foundry/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
)
conflicts=(
	'astra-foundry-bin'
	'astra-foundry-git'
)
sha256sums=(
	'4ddf4ccc5842dacec286993739b4590b378fdfeec5c994e5b47e328698f4b26f'
)
build()
{
	cd "${srcdir}/${pkgname}-${pkgver}"

	cmake -B build -S . -DCMAKE_BUILD_TYPE=Release -DASTRA_FOUNDRY_VERSION=${pkgver}
	cmake --build build
}
package()
{
	cd "${srcdir}/${pkgname}-${pkgver}"

	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
