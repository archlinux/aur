# Maintainer: Maxr1998 <max.rumpf1998@gmail.com>

pkgname=vramfs-git
_pkgbase=vramfs
pkgver=92.6e11407
pkgrel=2
pkgdesc="VRAM based file system for Linux"
arch=('x86_64')
url="https://github.com/Overv/vramfs"
license=('MIT')
depends=('ocl-icd' 'opencl-driver' 'fuse3')
makedepends=('git' 'opencl-headers')
source=("git+https://github.com/Overv/vramfs.git")
md5sums=("SKIP")

pkgver() {
	cd "$_pkgbase"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgbase"
	make
}

package() {
	cd "$_pkgbase"
	install -Dm755 bin/vramfs "$pkgdir/usr/bin/vramfs"
	awk '/The MIT License/,EOF { print substr($0, 5) }' README.md > LICENSE
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
