# Maintainer: jxir <aur@jxir.de>

pkgname=mucalc-git
pkgver=2.0.r0.gdb4f01e
pkgrel=1
pkgdesc="Convenient calculator for the command line"
arch=('x86_64')
url="https://marlam.de/mucalc/"
license=('GPL3')
depends=('muparser' 'readline')
makedepends=('cmake' 'git')
provides=('mucalc')
conflicts=('mucalc')
source=('git+https://git.marlam.de/git/mucalc.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/mucalc"
	git describe --long --tags | sed 's/mucalc-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/mucalc"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
}

build() {
  cd "$srcdir/mucalc/build"
  make
}

package() {
  cd "$srcdir/mucalc/build"
  make DESTDIR="$pkgdir" install
}
