# Maintainer: Gereon Kremer <gereon.kremer@cs.rwth-aachen.de>

pkgname=carl
pkgver=17.06.r0.gd9d0411c
pkgrel=1
pkgdesc="An Open Source C++ Library for Computer Arithmetic and Logic"
arch=("i686" "x86_64")
url="https://github.com/smtrat/carl"
license=('MIT')
depends=("gmp>=5.1" "eigen>=3.2" "boost>=1.55")
makedepends=("make" "cmake>=3.0")
conflicts=()
replaces=()
backup=()
source=("$pkgname::git+https://github.com/smtrat/carl.git#tag=17.06")
md5sums=('SKIP')

prepare() {
  cd "$pkgname" 
}
pkgver() {
  cd "$pkgname"
  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
  cd "$pkgname"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
  make resources
  make lib_carl
}
check() {
  cd "$pkgname"
  make
  make test
}
package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install
}
