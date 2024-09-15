# Contributor: Peter Mattern <pmattern at arcor dot de>

_pkgname=proj
pkgname=$_pkgname-git
pkgver=9.0.0.1406.g0a407325f
pkgrel=1
pkgdesc='Cartographic Projections Library'
arch=('i686' 'x86_64')
url='https://github.com/OSGeo/proj.4'
license=('MIT')
depends=('curl' 'gcc-libs' 'glibc' 'libtiff' 'sqlite')
makedepends=('git' 'cmake' 'gtest')
provides=("$_pkgname" "$_pkgname.4" "$_pkgname-configure-git")
conflicts=("$_pkgname" "$_pkgname.4" "$_pkgname-configure-git")
source=("$_pkgname::git+https://github.com/OSGeo/proj.4.git")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  git describe | sed 's:-:.:g'
}

build() {
  mkdir -p build ; cd build
  cmake $srcdir/$_pkgname -DCMAKE_INSTALL_PREFIX=/usr
  make
}

check(){
  ctest --test-dir build
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -D -m644 $srcdir/$_pkgname/COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
