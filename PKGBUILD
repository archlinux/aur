# Maintainer: Dan Griffiths <me at evertiro dot com>

pkgname=astra-atlas
pkgver=1.3.0
pkgrel=1
pkgdesc='Fast, lightweight Material Design 3 file manager'
arch=('x86_64')
url='https://github.com/AstraSuite/Atlas'
license=('GPL-3.0-only')
depends=(
	'glibc'
	'libstdc++'
	'qt6-base'
	'qt6-declarative'
	'qt6-svg'
	'qt6-multimedia'
)
optdepends=(
	'caelestia-cli: dynamic color scheme synching with Caelestia'
	'ffmpeg: integrated video and audio manipulation'
	'git: inline repository status and branch tracking'
	'gvfs: remote network filesystem mounting'
	'imagemagick: integrated image conversion and manipulation'
	'papirus-folders: dynamic folder color'
	'papirus-icon-theme: dynamic folder color'
	'udisks2: external drive management'
	'xdg-desktop-portal: desktop portal integration'
	'xdg-utils: default application launching'
	'bzip2: archive extraction and compression'
	'gzip: archive extraction and compression'
	'p7zip: archive extraction and compression'
	'tar: archive extraction and compression'
	'unzip: archive extraction and compression'
	'xz: archive extraction and compression'
	'zip: archive extraction and compression'
)
makedepends=(
	'cmake'
	'ninja'
)
source=(
	"https://github.com/AstraSuite/Atlas/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
)
conflicts=(
	'astra-atlas-bin'
	'astra-atlas-git'
)
sha256sums=(
	'42cffffab212cd6cf9fbc28bbaea24f56bf7283846aa3ec28708902050598604'
)
build()
{
	cd "${srcdir}/${pkgname}-${pkgver}"

	cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release -DATLAS_VERSION=${pkgver}
	cmake --build build
}
package()
{
	cd "${srcdir}/${pkgname}-${pkgver}"

	DESTDIR="${pkgdir}" cmake --install build
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
