# Maintainer: Aditya Mishra <https://github.com/pegvin/goxel2/issues>
pkgname=goxel2-git
pkgver=0.15.0.r14.g91f156a
pkgrel=1 # Update if you changed something but that is so minor change you don't want to change the version
pkgdesc="a cross-platform 3d voxel art editor"
arch=('i686' 'x86_64')
url="https://github.com/pegvin/goxel2"
license=('GPL3')
depends=(glfw gtk3)
makedepends=(git make tar curl scons pkg-config)
optdepends=()
provides=('goxel2-git')
conflicts=('goxel2' 'goxel2-git' 'goxel2-bin')
source=(git+https://github.com/goxel2/goxel2.git)
sha512sums=(SKIP)

pkgver() {
	cd goxel2
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd goxel2
	make release
}

package() {
    cd goxel2
	install -Dm644 data/goxel2.desktop "$pkgdir/usr/share/applications/goxel2.desktop"
	install -Dm644 icon.png "$pkgdir/usr/share/icons/goxel2.png"
	install -Dm755 goxel2 "$pkgdir/usr/bin/goxel2"
}
