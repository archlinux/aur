# Maintainer:  Eric Biggers <ebiggers3 at gmail dot com>

pkgname=ntfs-3g-system-compression-git
pkgver=0.1.r1.3ddd227
pkgrel=1
pkgdesc="NTFS-3G plugin for reading \"system compressed\" files"
arch=("i686" "x86_64")
url="https://github.com/ebiggers/ntfs-3g-system-compression"
license=("GPL2")
depends=("ntfs-3g-ar")
source=('git+https://github.com/ebiggers/ntfs-3g-system-compression.git')
sha256sums=('SKIP')
conflicts=('ntfs-3g-system-compression')
provides=('ntfs-3g-system-compression')
replaces=('ntfs-3g-system-compression')

pkgver() {
	cd ntfs-3g-system-compression
	local release="$(autoconf -t AC_INIT | sed -rn 's/.*AC_INIT:ntfs-3g-system-compression:([^:]+):.*/\1/p')"
	printf "%s.r%s.%s" "${release}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd ntfs-3g-system-compression
	autoreconf -i
}

build() {
	cd ntfs-3g-system-compression
	./configure --prefix=/usr
	make
}

package() {
	cd ntfs-3g-system-compression
	make DESTDIR="$pkgdir" install
	install -Dm644 README.md "$pkgdir/usr/share/doc/ntfs-3g-system-compression/README.md"
}
