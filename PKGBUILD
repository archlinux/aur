# Maintainer: Ariel Abreu <facekapow@outlook.com>

pkgname=partfs-git
pkgver=v0.1.0.r0.g125ad57
pkgrel=1
pkgdesc="FUSE-based file system for accessing partitions on a disk"
arch=('x86_64')
url="https://github.com/braincorp/partfs"
license=('BSD')
depends=(
	'fuse'
	'util-linux-libs'
)
makedepends=(
	'git'
	'cmake'
	'make'
	'gcc'
	'util-linux'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/braincorp/partfs.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D -t "$pkgdir/usr/bin" -o root -g root -m 755 build/bin/partfs
}
