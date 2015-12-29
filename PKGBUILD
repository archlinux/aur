# Maintainer: Minerva Wu
pkgname=rocaloid-ruce-git
pkgver=204.f4b9400
pkgrel=1
pkgdesc="A free vocal synthesis system --- UTAU Compatible Engine"
arch=(i686 x86_64)
url="http://rocaloid.org"
license=(GPL)
depends=()
makedepends=(cmake git)
source=(git+https://github.com/Rocaloid/RUCE.git#branch=nanodesu)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/RUCE"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/RUCE"
	git submodule init
	git submodule update
	[ -d build ] && rm -rf build
	mkdir build
	cd build
	cmake ..
  make
}

package() {
  cd "$srcdir/RUCE"
  make DESTDIR="$pkgdir" install
}
