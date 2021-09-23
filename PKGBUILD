# Contributor: Trevor Jim, amezin
# Maintainer: Carlos Bellino <carlosbellino@gmail.com>

pkgname=libwebcam-git
pkgver=0.2.5.r2.g0233106
pkgrel=1
pkgdesc="A library that is designed to simplify the development of webcam applications"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/libwebcam/"
license=('GPL3')
depends=('libxml2')
makedepends=('cmake' 'linux-headers' 'git')
source=("$pkgname::git+http://git.code.sf.net/p/libwebcam/code" 'fix_path.patch')
sha512sums=('SKIP' 'bd2c86e5e32a20a85bb36cdcfb47737a6bbf6dfd2b44126de679d7cd241eefcdec8983a54236d0ee574c2439c3deafafba3d02695ce5d8128a6646d7c9395d6e')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//g' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  patch -p2 -i ../fix_path.patch
}

build() {
  mkdir -p build
  cd build
  cmake ../$pkgname -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd $srcdir/build
  make DESTDIR=$pkgdir install
}
