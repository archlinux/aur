# Contributor: Trevor Jim, amezin
# Maintainer: Carlos Bellino <carlosbellino@gmail.com>

pkgname=libwebcam-git
pkgver=0.2.5.r2.g0233106
pkgrel=2
pkgdesc="A library that is designed to simplify the development of webcam applications"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/libwebcam/"
license=('GPL3')
depends=('libxml2')
makedepends=('cmake' 'linux-headers' 'git')
source=("$pkgname::git+http://git.code.sf.net/p/libwebcam/code" 'fix_path.patch')
sha512sums=('SKIP' 'f2b24ceb3f552678284a291a5eb28ea345d905796588a1251dbaff681cfba7331f4d6a4591070483dfcc60e960a3e03891bfd2cf71a19c02ed82786592e3deb4')

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
