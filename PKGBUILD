# Maintainer: Alexey Trifonov <otaku [at] rambler dot ru>
# Contributor: Tesx <tesfabpel@gmail.com>
pkgname=goxel-voxel-editor-git
pkgver=0.10.6.r2.e6dcae92
pkgrel=1
pkgdesc="Open Source 3D voxel editor for Mac, Windows and Linux. Git version."
arch=('i686' 'x86_64')
conflicts=('goxel')
provides=('goxel')
url="https://goxel.xyz/"
license=('GPL3')
groups=()
makedepends=(scons pkg-config)
depends=(glfw gtk3)
source=(
	"git+https://github.com/guillaumechereau/goxel.git"
    "goxel.desktop"
)
sha256sums=(
	'SKIP'
	'9b29df7405a9593396bc7ea810dc2871cce7c4ee474c1fa56d32f56c2ca2d921'
)

_gitname=goxel

pkgver() {

	cd $_gitname
	printf "%s" "$(git describe --first-parent --long --tags | sed 's/v//g;s/\([^-]*-\)g/r\1/;s/-/./g')"

}

build() {
	# don't fail on warnings:
	CFLAGS="${CFLAGS} -Wno-all"
	CXXFLAGS="${CFLAGS}"

	cd $_gitname
	make release
}

package() {
	install -Dm644 goxel.desktop "$pkgdir/usr/share/applications/goxel.desktop"
	install -Dm644 goxel/icon.png "$pkgdir/usr/share/icons/goxel.png"
	
	cd $_gitname
	install -Dm755 goxel "$pkgdir/usr/bin/goxel"
}
