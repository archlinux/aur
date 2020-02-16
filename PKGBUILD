# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Co-Maintainer: Gabriele Fulgaro <gabriele.fulgaro@gmail.com>

_pkgname=fuse-ext2

pkgname=$_pkgname-git
pkgver=v0.0.10.r38.g0d41378
pkgrel=1
pkgdesc='A multi OS FUSE module to mount ext2, ext3 and ext4 file system devices and/or images with read write support'
url="https://github.com/alperakcan/$_pkgname"
license=('GPL2')
arch=('any')
depends=('fuse2' 'e2fsprogs')
makedepends=('git')
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
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
