# Maintainer: envolution

pkgname='goxel-voxel-editor'
pkgver=0.15.1
pkgrel=5
pkgdesc="Open Source 3D voxel editor for Mac, Windows and Linux. Release version."
arch=('i686' 'x86_64')
url="https://goxel.xyz/"
license=('GPL3')
groups=()
makedepends=(scons pkg-config)
depends=(glfw gtk3)
provides=('goxel-voxel-editor')
conflicts=('goxel-voxel-editor')
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/guillaumechereau/goxel/archive/refs/tags/v${pkgver}.tar.gz"
    goxel.desktop
)
sha256sums=('01c9601ac9d8d38e29d3adff4b79a26c2b9fea4c2d2cb1d134471e499f8c4a84'
            '9b29df7405a9593396bc7ea810dc2871cce7c4ee474c1fa56d32f56c2ca2d921')

build() {
	# don't fail on warnings:
	CFLAGS="${CFLAGS} -Wno-all"
	CXXFLAGS="${CFLAGS}"

	cd goxel-$pkgver
	make release
}

package() {
	install -Dm644 goxel.desktop "$pkgdir/usr/share/applications/goxel.desktop"

	cd goxel-$pkgver
	install -Dm644 icon.png "$pkgdir/usr/share/icons/goxel.png"
	install -Dm755 goxel "$pkgdir/usr/bin/goxel"
}

# vim: ts=2 sw=2 et:
