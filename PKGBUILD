# Maintainer: Les De Ridder <aur@lesderid.net>

_pkgname=dtagfs
pkgname=dtagfs-git
pkgver=0.1.2.r0.g0adc5ba
pkgrel=1
pkgdesc="Tag-based FUSE virtual file system"
arch=('i386' 'x86_64')
url="https://git.fuwafuwa.moe/lesderid/dtagfs"
license=('custom:NCSA')
depends=('fuse' 'exempi')
makedepends=('git' 'dub' 'd-compiler')
provides=($_pkgname)
conflicts=($_pkgname)
source=('git+https://git.fuwafuwa.moe/lesderid/dtagfs')
md5sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"

  dub build -b=release
}

package() {
  cd "$srcdir/$_pkgname"

  mkdir -p $pkgdir/usr/bin/
  cp dtagfs $pkgdir/usr/bin/dtagfs
  ln -s /usr/bin/dtagfs $pkgdir/usr/bin/mount.fuse.dtagfs

  mkdir -p $pkgdir/usr/share/licenses/$_pkgname/
  cp LICENSE $pkgdir/usr/share/licenses/$_pkgname/LICENSE
}

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}
