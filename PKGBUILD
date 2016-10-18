# Maintainer: PkmX <pkmx.tw@gmail.com>
pkgname=gdcc-git
_pkgname=gdcc
pkgver=v0.11.0.r13.ga035de7
pkgrel=1
pkgdesc="Game Data Compiler Collection"
arch=('i686' 'x86_64')
url="https://github.com/DavidPH/GDCC"
license=('GPL')
depends=('gmp')
makedepends=('git' 'cmake')
provides=('gdcc')
conflicts=('gdcc')
source=("$_pkgname::git+https://github.com/DavidPH/GDCC")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$_pkgname/build"
  make "DESTDIR=$pkgdir" install
}

# vim:set ts=2 sw=2 et:
