# Maintainer: Gereon Kremer <gereon.kremer@cs.rwth-aachen.de>

pkgname=carl
pkgver=17.08
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
source=("https://github.com/smtrat/carl/archive/$pkgver.zip")
md5sums=('3fc7b590b386051bad44ead47a5bd00c')

prepare() {
  cd "$pkgname-$pkgver"
}
build() {
  cd "$pkgname-$pkgver"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DEXPORT_TO_CMAKE=OFF .
  make resources
  make lib_carl
}
check() {
  cd "$pkgname-$pkgver"
  make
  make test
}
package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
