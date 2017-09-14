# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: George Stelle <stelleg@gmail.com>
pkgname=argobots-git
pkgver=v1.0a1.r46.g8394f8a
pkgrel=1
pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgdesc="Lightweight, low-level threading and tasking framework"
arch=('x86_64')
url=""
license=('GPL')
source=("$pkgname"::"git+https://github.com/pmodels/argobots.git")
noextract=()
md5sums=('SKIP')
makedepends=('git automake autoconf gcc libtool')

build() {
	cd "$pkgname"
  ./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
