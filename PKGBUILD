# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname=fuse-ext2
pkgver=0.0.10
pkgrel=1
pkgdesc='A multi OS FUSE module to mount ext2, ext3 and ext4 file system devices and/or images with read write support'
url='https://github.com/alperakcan/fuse-ext2'
license=('GPL2')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
depends=('fuse2' 'e2fsprogs')
conflicts=("${pkgname}-git")
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('b884c0f92b706ae3f03dd75f489990e7cea31fd68526ade48ab5a11e1c9f78ec02a4dbb82450ce2aca12742a799c334a3ab8f2443a96ad003a76f0a86567fa24')

build() {
  cd "${pkgname}-${pkgver}"
  autoreconf --install --symlink
  CPPFLAGS='-include /usr/include/sys/sysmacros.h' ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
