# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=proj
pkgname=$_pkgname-configure-git
pkgver=4.9.0.247.g1384b97
pkgrel=1
pkgdesc='Cartographic Projections Library'
arch=('i686' 'x86_64')
url='https://github.com/OSGeo/proj.4'
license=('MIT')
makedepends=('git')
provides=("$_pkgname" "$_pkgname.4" "$_pkgname-git")
conflicts=("$_pkgname" "$_pkgname.4" "$_pkgname-git")
source=("$_pkgname::git+https://github.com/OSGeo/proj.4.git")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  git describe | sed 's:-:.:g'
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
  install -D -m644 $srcdir/$_pkgname/COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
