# Maintainer: Dan Griffiths <me at evertiro dot com>

pkgname=astra-atlas-git
pkgver=1.0.0.r2.g598f72c
pkgrel=2
pkgdesc='Fast, lightweight Material Design 3 file manager'
arch=('x86_64')
url='https://github.com/dim-ghub/Atlas'
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
	'git'
	'ninja'
)
source=(
	"$pkgname::git+$url.git"
)
provides=('astra-atlas')
conflicts=('astra-atlas')
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

	cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release
	cmake --build build
}
package()
{
	cd "${srcdir}/${pkgname}"

	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
