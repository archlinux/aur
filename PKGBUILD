# Maintainer: Kevin MacMartin <prurigro@gmail.com>

_pkgname=fuse-ext2
pkgname=$_pkgname-git
pkgver=v0.0.9.r97.gf0407ac
pkgrel=1
pkgdesc='A multi OS FUSE module to mount ext2, ext3 and ext4 file system devices and/or images with read write support'
url='https://github.com/alperakcan/fuse-ext2'
license=('GPL2')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
depends=('fuse2' 'e2fsprogs')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's|^[^-]*-v||;s|-|.r|;s|-|.|g'
}

build() {
  cd $_pkgname
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
  mv "$pkgdir/usr/sbin/mount.fuse-ext2" "$pkgdir/usr/bin"
  rmdir "$pkgdir/usr/sbin"
}
