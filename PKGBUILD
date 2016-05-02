# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=proj
pkgname=$_pkgname-git
pkgver=4.9.0.247.g1384b97
pkgrel=1
pkgdesc='Cartographic Projections Library'
arch=('i686' 'x86_64')
url='https://github.com/OSGeo/proj.4'
license=('MIT')
makedepends=('git' 'cmake')
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

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -D -m644 $srcdir/$_pkgname/COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
