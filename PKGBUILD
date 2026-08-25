# Maintainer: Dan Griffiths <me at evertiro dot com>

pkgname=astra-atlas
pkgver=1.0.0
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
	'gio: CLI URI mounting and volume management'
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
	"https://github.com/AstraSuite/Atlas/releases/download/v${pkgver}/atlas-${pkgver}.tar.gz"
)
conflicts=('astra-atlas-git')
sha256sums=(
	'9ccce0c55e432c2a12bc724d5485badedd83a22bbfe5d7b0b6347e1134c81721'
)
build()
{
	cd "${srcdir}/atlas-${pkgver}"

	cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release
	cmake --build build
}
package()
{
	cd "${srcdir}/atlas-${pkgver}"

	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
