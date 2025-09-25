# Maintainer: Zorbatron <46525467+Zorbatron@users.noreply.github.com>

pkgname=nsutils-git
_pkgname=nsutils
pkgver=v0.2.r7.b573702
pkgrel=1

pkgdesc="Nsutils suite includes a number of utilities to list, add/remove tag, and join namespaces"
arch=('x86_64')
url='https://github.com/rd235/nsutils'
license=('GPL-2.0')
makedepends=('make' 'coreutils' 'cmake')
provides=('nsutils')
conflicts=('nsutils')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  git -C $_pkgname describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd $srcdir/$_pkgname
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make -j $(nproc)
}

package() {
  cd $srcdir/$_pkgname/build
  make DESTDIR="$pkgdir" install
}

