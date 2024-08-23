# Maintainer: Benjamin Stürz <benni@stuerz.xyz>
pkgname=fuse-ufs-git
pkgver=0.2.1.r8.ga1ab71e
pkgrel=1
pkgdesc="FUSE implementation of FreeBSD's UFSv2"
arch=(x86_64)
url="https://github.com/realchonk/fuse-ufs"
source=("fuse-ufs::git+https://github.com/realchonk/fuse-ufs")
license=('BSD')
sha256sums=('SKIP')
makedepends=('git' 'cargo')
depends=('fuse3')
conflicts=('fuse-ufs')
provides=("fuse-ufs=${pkgver}")

pkgver() {
	cd "fuse-ufs"
	git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "fuse-ufs"
	make
}

package() {
	cd "fuse-ufs"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}
