# Maintainer: Gereon Kremer <gereon.kremer@cs.rwth-aachen.de>

pkgname=carl
pkgver=17.08
pkgrel=1
pkgdesc="An Open Source C++ Library for Computer Arithmetic and Logic"
arch=("i686" "x86_64")
url="https://github.com/smtrat/carl"
license=('MIT')
depends=("boost>=1.55" "cln>=1.3" "eigen>=3.2" "gmp>=5.1")
makedepends=("cmake>=3.0" "make>=4.2")
conflicts=()
replaces=()
backup=()
source=("https://github.com/smtrat/carl/archive/$pkgver.zip")
md5sums=('3fc7b590b386051bad44ead47a5bd00c')

build() {
  mkdir -p "$pkgname-$pkgver/build"
  cd "$pkgname-$pkgver/build"
  cmake \
    -DCMAKE_BUILD_TYPE=Release -DEXPORT_TO_CMAKE=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib \
    -DTHREAD_SAFE=ON -DUSE_CLN_NUMBERS=ON \
    ../
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
