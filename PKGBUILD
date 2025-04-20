# Maintainer: Sumit Pathak <sumitpathak2002@gmail.com>

pkgname=spicy-git
pkgver=r1.0.0
pkgrel=1
pkgdesc="A parser generator and runtime for network protocol parsers (from Zeek Project) - Git version"
arch=('x86_64')
url="https://github.com/zeek/spicy"
license=('BSD')
depends=('cmake' 'gcc' 'make' 'bison' 'flex' 'python' 'libpcap' 'zlib')
makedepends=('git' 'python-setuptools' 'swig')
provides=('spicy')
conflicts=('spicy')
source=("${pkgname}::git+https://github.com/zeek/spicy.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's/^v//;s/-/r/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$pkgname/build"
  make DESTDIR="$pkgdir" install
}

