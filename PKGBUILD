# Maintainer: Maxr1998 <max.rumpf1998@gmail.com>

pkgname=vramfs-git
_pkgname=vramfs
pkgver=1.0
pkgrel=1
pkgdesc="VRAM based file system for Linux"
arch=('x86_64')
url="https://github.com/Overv/vramfs"
license=('MIT')
depends=('ocl-icd' 'opencl-driver' 'fuse2')
makedepends=('opencl-headers')
source=("git+https://github.com/Overv/vramfs.git")
md5sums=("SKIP")

build() {
	cd "$srcdir/$_pkgname"
	make
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 bin/vramfs "$pkgdir/usr/bin/vramfs"
    awk '/The MIT License/,EOF { print substr($0, 5) }' README.md > LICENSE
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
