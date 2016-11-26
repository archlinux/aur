# Maintainer: Darrell Enns <darrell@darrellenns.com>
pkgname=tunescope-git
pkgver=r3.0c2e5f8
pkgrel=1
pkgdesc="An oscilloscope style guitar tuner"
arch=('any')
url="https://github.com/dack/tunescope"
license=('GPL')
depends=(jack glut)
makedepends=(cmake jack glut)
source=("${pkgname}"::'git+https://github.com/dack/tunescope.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname/build"
	cmake -D CMAKE_INSTALL_PREFIX='/usr' ..
	make
}

package() {
	cd "$pkgname/build"
	make DESTDIR="$pkgdir/" install
}
