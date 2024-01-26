# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=fuse-ext2
pkgver=0.0.11
pkgrel=1
pkgdesc='A multi OS FUSE module to mount ext2, ext3 and ext4 file system devices and/or images with read write support'
url='https://github.com/alperakcan/fuse-ext2'
license=('GPL-2.0-only')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
depends=('fuse2' 'e2fsprogs' 'glibc')
conflicts=("${pkgname}-git")
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('2307eb7db8a9f52cbab3fa4b0dfac0d6804d476002661cc0a97b870bbac1e80dfc92bf8759612e5fe2919af2214d921cc43764252739f336060cc91f08179b06')

build() {
	cd "${pkgname}-${pkgver}"
	autoreconf --install --symlink
	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
